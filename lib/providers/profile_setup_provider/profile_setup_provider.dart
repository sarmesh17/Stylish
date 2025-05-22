import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/providers/auth_provider/auth_provider.dart';
import 'package:stylish/repo/profile_setup_repo/profile_setup_repo.dart';

part 'profile_setup_provider.g.dart';

final firebaseDatabaseProvider = Provider((ref) => FirebaseDatabase.instance);
final fetchUserDetailProvider = FutureProvider((ref){
  final profileSetupRepo = ref.read(profileSetupRepoProvider);
 return profileSetupRepo.fetchCurrentUserDetails();

});

@riverpod
ProfileSetupRepo profileSetupRepo(Ref ref) {
  return ProfileSetupRepo(
    ref.watch(firebaseDatabaseProvider),
    ref.watch(firebaseAuthProvider),
  );
}




