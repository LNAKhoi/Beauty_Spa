part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();

  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  const Authenticated();
  @override
  List<Object> get props => [];
}

class UnAuthenticated extends AuthState {
  const UnAuthenticated();
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String errorMessage;
  const AuthError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
