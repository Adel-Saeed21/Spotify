import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spotify/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:spotify/features/auth/data/model/user_model.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUser mockUser;
  late MockUserCredential mockUserCredential;
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();

    dataSource = AuthRemoteDataSourceImpl(mockFirebaseAuth);
  });

  const tName = 'Ahmed';
  const tEmail = 'ahmed@test.com';
  const tPassword = '123456';

  group('register', () {
    test(
      'should create user, update display name, reload, and return UserModel',
      () async {
        // Arrange
        when(
          () => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => mockUserCredential);

        when(() => mockUserCredential.user).thenReturn(mockUser);
        when(() => mockUser.updateDisplayName(any())).thenAnswer((_) async {});
        when(() => mockUser.reload()).thenAnswer((_) async {});
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(() => mockUser.uid).thenReturn('uid_123');
        when(() => mockUser.email).thenReturn(tEmail);
        when(() => mockUser.displayName).thenReturn(tName);

        // Act
        final result = await dataSource.register(
          name: tName,
          email: tEmail,
          password: tPassword,
        );

        // Assert
        expect(result, isA<UserModel>());
        verify(
          () => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          ),
        ).called(1);
        verify(() => mockUser.updateDisplayName(tName)).called(1);
        verify(() => mockUser.reload()).called(1);
        verify(() => mockFirebaseAuth.currentUser).called(1);
        verifyNoMoreInteractions(mockFirebaseAuth);
      },
    );

   test(
  'should throw FirebaseAuthException when credential.user is null',
  () async {
    when(
      () => mockFirebaseAuth.createUserWithEmailAndPassword(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => mockUserCredential);
    when(() => mockUserCredential.user).thenReturn(null);

    await expectLater(
      () => dataSource.register(
        name: tName,
        email: tEmail,
        password: tPassword,
      ),
      throwsA(isA<FirebaseAuthException>()),
    );
  },
);
  });
}
