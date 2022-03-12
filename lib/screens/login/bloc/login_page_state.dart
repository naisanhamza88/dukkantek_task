part of 'login_page_bloc.dart';

abstract class LoginPageState extends Equatable {
  const LoginPageState();
}

class LoginPageInitial extends LoginPageState {
  @override
  List<Object> get props => [];
}

class LoginFailure extends LoginPageState {

  const LoginFailure();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginFailure';
}

class LoginError extends LoginPageState {
  final String error;

  const LoginError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginProblem { error: $error }';
}
