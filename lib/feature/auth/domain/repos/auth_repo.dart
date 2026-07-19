import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/feature/auth/domain/entities/user_entity.dart';

/// Authentication repository contract.
///
/// Defines all authentication-related operations
/// without exposing implementation details.
///
/// العقد الخاص بجميع عمليات المصادقة.

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();

  // Stores the authenticated user's profile in Firestore.
  //
  // Called immediately after account creation
  // or after the first social login.
  //
  // حفظ بيانات المستخدم داخل Firestore
  // بعد إنشاء الحساب أو أول تسجيل دخول اجتماعي.

  Future addUserData({required UserEntity user});

  // Retrieves the user's profile from Firestore.
  //
  // Firebase Authentication only stores authentication data
  // (uid, email, provider...).
  //
  // Additional application data is stored separately
  // in Firestore and fetched through this method.
  //
  // جلب بيانات المستخدم من Firestore.
  //
  // Firebase Authentication يحتفظ فقط ببيانات تسجيل الدخول
  // أما بيانات التطبيق مثل الاسم والصورة وغيرها
  // فتكون محفوظة داخل Firestore.

  Future<UserEntity> getUserData({required String uid});

  Future saveUserData({required UserEntity user});
}
