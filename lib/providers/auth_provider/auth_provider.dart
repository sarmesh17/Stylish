//Provider for FirebaseAuth instance
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/repo/auth_repo/auth_repo.dart';

part 'auth_provider.g.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
final firebaseGoogleProvider = Provider((ref) => GoogleSignIn());

@riverpod
AuthRepo authRepo(Ref ref) {
  return AuthRepo(
    ref.watch(firebaseAuthProvider),
    ref.watch(firebaseGoogleProvider),
  );
}

@riverpod
Stream<User?> authStateChange(Ref ref) {
  return ref.watch(authRepoProvider).authState;
}
