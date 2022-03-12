part of 'login_page_bloc.dart';

abstract class LoginPageEvent extends Equatable {
  const LoginPageEvent();
}

class CheckUserName extends LoginPageEvent {
  final String userName;
  final BuildContext context;

  const CheckUserName(this.userName, this.context);

  @override
  List<Object> get props => [userName];

  @override
  String toString() => 'CheckMobileNumber' + userName;
}

class CheckPassword extends LoginPageEvent {
  final String password;
  final BuildContext context;

  const CheckPassword(this.password, this.context);

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'CheckPassword' + password;
}

class Login extends LoginPageEvent {
  final String password;
  final String userName;
  final BuildContext context;

   const Login(this.userName, this.password, this.context);

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'CheckPassword' + password;
}

class GoogleLogin extends LoginPageEvent {
  final BuildContext context;

  const GoogleLogin(this.context);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'GoogleLogin';
}


class FingerprintScanned extends LoginPageEvent {
  final BuildContext context;
  const FingerprintScanned({required this.context});
  @override
  List<Object> get props => [];

  @override
  String toString() => 'FingerprintScanned';
}


class LoginFailureEvent extends LoginPageEvent {

  const LoginFailureEvent();

  @override
  List<Object> get props => [];
}

class LoginErrorEvent extends LoginPageEvent {
  final String error;
  const LoginErrorEvent({required this.error});

  @override
  List<Object> get props => [];
}