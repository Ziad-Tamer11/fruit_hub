import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/feature/auth/domain/entities/user_entity.dart';

/// Data Model responsible for converting user data
/// between Firebase/Firestore and the application's domain layer.
///
/// مسؤول عن تحويل بيانات المستخدم القادمة من Firebase أو Firestore
/// إلى UserEntity والعكس.

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  // Creates a UserModel from the authenticated Firebase user.
  //
  // Used after successful authentication (Google/Facebook)
  // to extract the basic user information returned by Firebase Auth.
  //
  // يتم استخدامه بعد نجاح تسجيل الدخول لاستخراج بيانات المستخدم
  // الأساسية القادمة من Firebase Authentication.

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }

  // Converts Firestore document data into a UserModel.
  //
  // Used when fetching the user's profile from Firestore.
  //
  // يحول البيانات القادمة من Firestore إلى UserModel.

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }
}
