import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/auth/domain/usecase/register_usecase.dart';
import 'package:spotify/features/auth/presentation/logic/auth_event.dart';
import 'package:spotify/features/auth/presentation/logic/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this._registerUseCase})
      : super(const AuthInitial()) {
    on<RegisterRequested>(_onRegisterRequested);
  }

  final RegisterUseCase _registerUseCase;

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await _registerUseCase(
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
}