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
