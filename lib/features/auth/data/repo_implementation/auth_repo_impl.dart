import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/core/errors/failures.dart';
import 'package:spotify/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:spotify/features/auth/domain/entities/user_entity.dart';
import 'package:spotify/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this._remote);
  final AuthRemoteDataSource _remote;

  @override
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await _remote.register(
        name: name,
        email: email,
        password: password,
      );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(_mapAuthError(e.code)));
    } catch (_) {
      return const Left(ServerFailure('Something went wrong, try again'));
    }
  }

  String _mapAuthError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'invalid-email':
        return 'The email address is not valid';
      case 'weak-password':
        return 'The password is too weak';
      case 'operation-not-allowed':
        return 'Email/password sign up is not enabled';
      case 'network-request-failed':
        return 'Check your internet connection';
      default:
        return 'Authentication failed, try again';
    }
  }
}
