part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

class SingUpLoadingState extends AuthenticationState {}

class SingUpSuccessState extends AuthenticationState {}

class SingUpErrorState extends AuthenticationState {
  final String error;

  SingUpErrorState({required this.error});
}

class LogInLoadingState extends AuthenticationState {}

class LogInSuccessState extends AuthenticationState {}

class LogInErrorState extends AuthenticationState {
  final String error;

  LogInErrorState({required this.error});
}

class GooglLogInLoadingState extends AuthenticationState {}

class GooglLogInSuccessState extends AuthenticationState {}

class GooglLogInErrorState extends AuthenticationState {
  final String error;

  GooglLogInErrorState({required this.error});
}

class LogOutLoadingState extends AuthenticationState {}

class LogOutSuccessState extends AuthenticationState {}

class LogOutErrorState extends AuthenticationState {
  final String error;

  LogOutErrorState({required this.error});
}

class ResetPasswordLoadingState extends AuthenticationState {}

class ResetPasswordSuccessState extends AuthenticationState {}

class ResetPasswordErrorState extends AuthenticationState {
  final String error;

  ResetPasswordErrorState({required this.error});
}

class AddUserLoadingState extends AuthenticationState {}

class AddUserSuccessState extends AuthenticationState {}

class AddUserErrorState extends AuthenticationState {
  final String error;

  AddUserErrorState({required this.error});
}

class GetUserLoadingState extends AuthenticationState {}

class GetUserSuccessState extends AuthenticationState {}

class GetUserErrorState extends AuthenticationState {
  final String error;

  GetUserErrorState({required this.error});
}
