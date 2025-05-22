import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:logger/logger.dart';
import 'package:stylish/models/user_info_model/user_info_model.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileSetupRepo {
  final FirebaseDatabase _database;
  final FirebaseAuth _firebaseAuth;
  final logger = Logger();

  ProfileSetupRepo(this._database,this._firebaseAuth);

 Future<void> saveUserDetails(UserInfoModel user) async {
  try {
    final uid = _firebaseAuth.currentUser?.uid;
    if (uid == null) {
      logger.w("No user is signed in. Cannot save details.");
      return;
    }

    await _database.ref().child('users').child(uid).set(user.toJson());
    logger.i("User data saved successfully for UID: $uid");
  } catch (e) {
    logger.e('Error saving user data', error: e.toString());
  }
}


 Future<UserInfoModel?> fetchCurrentUserDetails() async {
  try {
    final uid = _firebaseAuth.currentUser?.uid;
    if (uid == null) {
      logger.w("No user is signed in");
      return null;
    }

    final snapshot = await _database.ref().child('users').child(uid).get();
    if (snapshot.exists) {
      final userMap = Map<String, dynamic>.from(snapshot.value as Map);
      final user = UserInfoModel.fromJson(userMap);
      logger.i("Fetched current user details");
      return user;
    } else {
      logger.w("No data found for user with UID $uid");
      return null;
    }
  } catch (e) {
    logger.e('Error fetching current user data', error: e.toString());
    return null;
  }
}


  Future<String> convertImageToBase64(XFile file) async {
    final bytes = await File(file.path).readAsBytes();
    return base64Encode(bytes);
  }
}
