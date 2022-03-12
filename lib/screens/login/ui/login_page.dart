import 'dart:developer';

import 'package:dukkantek_task/config/ui_config.dart';
import 'package:dukkantek_task/screens/login/bloc/login_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

import '../../../common/ui.dart';
import '../../../generated/l10n.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _bloc = LoginPageBloc();

  // declare controllers of textFormFields to listen for
  // user input and update controller
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool passwordError = false;
  bool userNameError = false;

  // Initially password is obscure
  bool _passwordVisible = false;

  bool _isAuthenticated = false;
  bool isBiometricAvailable = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
    _usernameController.addListener(() {
      _bloc.userNameEventSink
          .add(CheckUserName(_usernameController.text, context));
    });
    _passwordController.addListener(() {
      _bloc.passwordEventSink
          .add(CheckPassword(_passwordController.text, context));
    });

    Future.delayed(Duration.zero, () {
      _isBiometricAvailable().then((value) => setState(() {
            isBiometricAvailable = value;
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                top: 0.2.sh, end: 0.1.sw, start: 0.1.sw, bottom: 0.2.sw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Center(
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 0.1.sh,
                ),
                Text(S.of(context).username,
                    style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontSize: 35.sp) ??
                        Theme.of(context).textTheme.headline4),

                // username textField
                StreamBuilder<String>(
                    stream: _bloc.streamUserName,
                    builder: (context, snapshot) {
                      String error = '';
                      if (snapshot.hasError) {
                        userNameError = true;
                        error = snapshot.error.toString();
                      } else {
                        userNameError = false;
                      }
                      return getTextField(
                        context: context,
                        icon: const Icon(
                          Icons.person,
                          color: mainColor,
                        ),
                        controller: _usernameController,
                        hint: S.of(context).username_hint,
                        errorMsg: error,
                      );
                    }),

                Text(S.of(context).password,
                    style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontSize: 35.sp) ??
                        Theme.of(context).textTheme.headline4),

                // password textField
                StreamBuilder<String>(
                    stream: _bloc.streamPassword,
                    builder: (context, snapshot) {
                      String error = '';
                      if (snapshot.hasError) {
                        error = snapshot.error.toString();
                        passwordError = true;
                      } else {
                        passwordError = false;
                      }
                      return getTextField(
                          context: context,
                          controller: _passwordController,
                          icon: const Icon(
                            Icons.password,
                            color: mainColor,
                          ),
                          onIconPressed: showHidePassword,
                          hint: S.of(context).password_hint,
                          errorMsg: error,
                          obscureText: !_passwordVisible);
                    }),
                // LoginButton
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(S.of(context).login),
                    onPressed: () {
                      _onLoginButtonPressed();
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 0.1.sh),
                  child: isBiometricAvailable
                      ? Center(
                          child: GestureDetector(
                            onTap: () {
                              _onFingerprintScanned();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.fingerprint,
                                  color: mainColor,
                                  size: 50.0,
                                ),
                                Container(
                                  height: 10.h,
                                ),
                                Text(S.of(context).using_biometrics_credentials,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        ?.copyWith(fontSize: 35.sp)),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          )),
    );
  }

  Future<bool> _isBiometricAvailable() async {
    // check for biometric availability
    final LocalAuthentication auth = LocalAuthentication();
    bool isBiometricAvailable = false;
    isBiometricAvailable = await auth.canCheckBiometrics;
    return isBiometricAvailable;
  }

  void showHidePassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _onFingerprintScanned() async {
    await _checkBiometric();
    if (_isAuthenticated) {
      // BlocProvider.of<LoginBloc>(context)
      //     .add(FingerprintScanned(context: context));
    }
  }

  Future<void> _checkBiometric() async {
    final LocalAuthentication auth = LocalAuthentication();
    // authenticate with biometrics
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: S.of(context).place_your_finge,
        biometricOnly: true,
        useErrorDialogs: true,
        androidAuthStrings: AndroidAuthMessages(
          signInTitle: S.of(context).login,
          cancelButton: S.of(context).use_account_password,
          goToSettingsDescription: S.of(context).fingerprint_setting,
          goToSettingsButton: S.of(context).go_to_setting,
        ),
        iOSAuthStrings: IOSAuthMessages(
          cancelButton: S.of(context).use_account_password,
          goToSettingsButton: S.of(context).go_to_setting,
          goToSettingsDescription: S.of(context).fingerprint_setting,
        ),
      );
      setState(() {
        _isAuthenticated = authenticated;
      });
    } catch (e) {
      setState(() {
        isBiometricAvailable = false;
        _isAuthenticated = false;
        log('error using biometric auth: $e');
      });
    }
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  void _onLoginButtonPressed() {
    if (!userNameError &&
        !passwordError &&
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      BlocProvider.of<LoginPageBloc>(context).add(
          Login(_usernameController.text, _passwordController.text, context));
    }
  }
}
