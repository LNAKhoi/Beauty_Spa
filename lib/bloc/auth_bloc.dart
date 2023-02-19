import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(UnAuththenticated()) {
    /*When User Presses the SignIn Button, we will send the SignInRequested Event to the
     AuthBloc to handle it and emit the Authenticated State if the user is authenticated*/

    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        // add auth.Login here
      } catch (exception) {
        emit(AuthError(exception.toString()));
      }
    });

    on<SignUpRequested>((event, emit) {
      emit(AuthLoading());
      try {
        // add auth.sign up here
      } catch (exception) {
        emit(AuthError(exception.toString()));
      }
    });

    on<SignOutRequested>((event, emit) {
      emit(AuthLoading());
      try {
        // add auth.sign out here
        emit(UnAuththenticated());
      } catch (exception) {
        emit(AuthError(exception.toString()));
      }
    });
  }
}
