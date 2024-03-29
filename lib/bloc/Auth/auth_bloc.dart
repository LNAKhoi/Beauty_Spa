import 'package:beauty_spa/repositories/Auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Auth auth;
  AuthBloc({required this.auth}) : super(UnAuthenticated()) {
    /*
    When User Presses the SignIn Button, we will send the SignInRequested Event to the
     AuthBloc to handle it and emit the Authenticated State if the user is authenticated
     */

    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        // add auth.Login here
        await auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (exception) {
        emit(AuthError(exception.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        // add auth.sign up here
        await auth.createUserWithEmailAndPassword(
            phoneNumber: event.phoneNumber,
            fullName: event.fullName,
            birthday: event.birthday,
            email: event.email,
            password: event.password);
        emit(Authenticated());
      } catch (exception) {
        emit(AuthError(exception.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await auth.signOut();
        emit(UnAuthenticated());
      } catch (exception) {
        emit(AuthError(exception.toString()));
      }
    });
  }
}
