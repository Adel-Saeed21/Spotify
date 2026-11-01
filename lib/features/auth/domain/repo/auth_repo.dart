import 'package:dartz/dartz.dart';
import 'package:spotify/core/errors/failures.dart';
import 'package:spotify/features/auth/domain/entities/user_entity.dart';
import 'package:spotify/features/auth/domain/usecase/sign_in_usecase.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signIn({
    required SignInParams params,
  });

}