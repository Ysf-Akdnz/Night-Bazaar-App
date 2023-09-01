import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  const AuthRepository(this._auth);

  final FirebaseAuth _auth;

  Stream<User?> get authStateChange => _auth.idTokenChanges();

  

  
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}
