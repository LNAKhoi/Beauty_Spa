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

class Auththenticated extends AuthState {
  const Auththenticated();
  @override
  List<Object> get props => [];
}

class UnAuththenticated extends AuthState {
  const UnAuththenticated();
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String errorMessage;
  const AuthError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
