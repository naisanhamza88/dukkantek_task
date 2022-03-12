import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dukkantek_task/config/utility.dart';
import 'package:dukkantek_task/generated/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> with Utility {
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
      passwordSink.addError(
          'Please enter password Minimum eight characters,'
              ' at least one letter and one number:');
    } else {
      passwordSink.add('DONE');
    }
  }

  void mapLoginToState(Login event) async{
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {

    }else{
      showToast(event.context, S.of(event.context).no_internet_connection);
    }
  }
}
