// ignore_for_file: prefer_const_constructors_in_immutables

part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}



class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

class SignUpRequested extends AuthEvent {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String birthday;

  SignUpRequested(this.fullName, this.email, this.phoneNumber, this.password,
      this.birthday);
}

class SignOutRequested extends AuthEvent{}
