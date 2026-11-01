import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/auth/domain/usecase/register_usecase.dart';
import 'package:spotify/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:spotify/features/auth/presentation/logic/auth_event.dart';
import 'package:spotify/features/auth/presentation/logic/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.registerUseCase, required this.signInUsecase})
    : super(const AuthInitial()) {
    on<RegisterRequested>(_onRegisterRequested);
    on<SignInRequested>(_onSignInRequested);
  }

  final RegisterUseCase registerUseCase;
  final SignInUsecase signInUsecase;

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await registerUseCase(
      RegisterParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (state is AuthLoading) return;

    emit(const AuthLoading());

    final result = await signInUsecase(
      SignInParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
