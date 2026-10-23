import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify/core/errors/failures.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/auth/domain/entities/user_entity.dart';
import 'package:spotify/features/auth/domain/repo/auth_repo.dart';

class RegisterUseCase implements UseCase<UserEntity, RegisterParams> {
  RegisterUseCase(this._repo);
  final AuthRepo _repo;

  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) {
    return _repo.register(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<Object?> get props => [name, email, password];
}