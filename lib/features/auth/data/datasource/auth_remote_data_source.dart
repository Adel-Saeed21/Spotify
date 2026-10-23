import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/features/auth/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._auth);
  final FirebaseAuth _auth;

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user!.updateDisplayName(name);
    await credential.user!.reload();

    return UserModel.fromFirebase(_auth.currentUser!);
  }
}