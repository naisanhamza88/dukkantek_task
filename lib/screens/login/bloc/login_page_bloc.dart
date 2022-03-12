import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dukkantek_task/config/utility.dart';
import 'package:dukkantek_task/generated/l10n.dart';
import 'package:dukkantek_task/screens/login/login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> with Utility {
  final LoginRepository _loginRepository = LoginRepository();
  final _userNameStreamController = StreamController<String>();

  StreamSink<String> get userNameSink => _userNameStreamController.sink;

  Stream<String> get streamUserName => _userNameStreamController.stream;
  final _userNameEventController = StreamController<CheckUserName>();

  Sink<CheckUserName> get userNameEventSink => _userNameEventController.sink;

  final _passwordStreamController = StreamController<String>();

  StreamSink<String> get passwordSink => _passwordStreamController.sink;

  Stream<String> get streamPassword => _passwordStreamController.stream;
  final _passwordEventController = StreamController<CheckPassword>();

  Sink<CheckPassword> get passwordEventSink => _passwordEventController.sink;

  LoginPageBloc() : super(LoginPageInitial()) {
    _userNameEventController.stream.listen(_checkUserName);
    _passwordEventController.stream.listen(_checkPassword);
    on<Login>((event, emit) {
      mapLoginToState(event);
    });
    on<FingerprintScanned>((event, emit) {
      _mapFingerprintScannedToState(event);
    });
    on<GoogleLogin>((event, emit) {
      signInWithGoogle(event);
    });
    on<LoginFailureEvent>((event, emit) => emit.call(const LoginFailure()));
    on<LoginErrorEvent>(
            (event, emit) => emit.call(LoginError(error: event.error)));
  }

  void dispose() {
    _userNameStreamController.close();
    _userNameEventController.close();

    _passwordStreamController.close();
    _passwordEventController.close();
  }

  void _checkUserName(CheckUserName event) {
    if (event.userName.isEmpty) {
      userNameSink.addError('Please enter User Name');
    } else {
      userNameSink.add('DONE');
    }
  }

  void _checkPassword(CheckPassword event) {
    const String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    final RegExp regExp = RegExp(pattern);
    if (event.password.isEmpty) {
      passwordSink.addError('Please enter Password');
    } else if (!regExp.hasMatch(event.password)) {
      passwordSink.addError('Please enter password Minimum eight characters,'
          ' at least one letter and one number:');
    } else {
      passwordSink.add('DONE');
    }
  }

  void mapLoginToState(Login event) async {
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      await _loginRepository
          .login(userName: event.userName, password: event.password)
          .then((value) {
        showToast(event.context, 'Api Called without Link');
        log('$value Done');
      });
    } else {
      add(LoginErrorEvent(error: S
          .of(event.context)
          .no_internet_connection));
    }
  }

  void _mapFingerprintScannedToState(FingerprintScanned event) async {
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      /// we should cached user name and password and call it here
      await _loginRepository
          .login(userName: "userName", password: "password")
          .then((value) {
        showToast(event.context, 'Api Called without Link');
        log('$value Done');
      });
    } else {
      add(LoginErrorEvent(error: S
          .of(event.context)
          .no_internet_connection));
    }
  }


  void signInWithGoogle(GoogleLogin event) async {
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn
        .signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
    await googleSignInAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
    final authResult = await _auth.signInWithCredential(credential);
    final User? _user = authResult.user;
    final User? currentUser = _auth.currentUser;
    print("User Name: ${_user?.displayName ?? ''}");
    print("User Email ${_user?.email ?? ''}");
    showToast(event.context, 'User Name: ${_user?.displayName ?? ''} And User '
        'Email ${_user?.email ?? ''}');
    } else {
      add(LoginErrorEvent(error: S
          .of(event.context)
          .no_internet_connection));
    }
  }
}
