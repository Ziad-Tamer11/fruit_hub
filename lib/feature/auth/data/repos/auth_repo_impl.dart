import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/feature/auth/data/model/user_model.dart';
import 'package:fruit_hub/feature/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/feature/auth/domain/repos/auth_repo.dart';

/// Repository implementation responsible for coordinating
/// between Firebase Authentication and Firestore.
///
/// Flow:
/// UI
///   ↓
/// Cubit
///   ↓
/// UseCase
///   ↓
/// AuthRepoImpl
///      ├── FirebaseAuthService
///      └── FirestoreService
///
/// مسئول عن الربط بين Firebase Authentication
/// و Firestore لتنفيذ جميع عمليات المصادقة.

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.errMessage));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uid: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errMessage));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    bool shouldDeleteUser = false;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      UserEntity userEntity;
      var isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndpoint.isUserExist,
        documentId: user.uid,
      );
      if (isUserExist) {
        userEntity = await getUserData(uid: user.uid);
      } else {
        shouldDeleteUser = true;
        userEntity = UserModel.fromFirebaseUser(user);
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      if (shouldDeleteUser) {
        await deleteUser(user);
      }
      return left(ServerFailure(e.errMessage));
    } catch (e) {
      if (shouldDeleteUser) {
        await deleteUser(user);
      }
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  // This flag is used to determine whether the Firebase Auth user should be deleted
  // if an exception occurs. We only delete newly created social accounts when
  // saving their Firestore data fails, to avoid leaving orphaned Auth accounts.
  // Existing users must never be deleted.
  //!------------------------------------------------------------------------------------
  // نحذف المستخدم من Firebase Auth فقط إذا كان ده أول تسجيل دخول له
  // وتم إنشاء الحساب لكن فشل حفظ بياناته في Firestore.
  // أما المستخدم القديم فلا يتم حذفه إطلاقًا إذا حدث خطأ أثناء جلب بياناته.
  Future<void> deleteUserIfNeeded(bool shouldDeleteUser, User? user) async {
    if (shouldDeleteUser) {
      await deleteUser(user);
    }
    // This helper should be called only in the catch blocks of
    // signInWithGoogle() and signInWithFacebook().
    // It deletes the Firebase Auth user only when shouldDeleteUser is true.
    //!----------------------------------------------------------------------------------
    // تُستخدم هذه الـ helper داخل الـ catch في signInWithGoogle و
    // signInWithFacebook بدلاً من استدعاء deleteUser() مباشرة.
    // يتم حذف المستخدم فقط إذا كانت قيمة shouldDeleteUser = true.
    await deleteUserIfNeeded(shouldDeleteUser, user);
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    bool shouldDeleteUser = false;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      UserEntity userEntity;
      var isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndpoint.isUserExist,
        documentId: user.uid,
      );
      if (isUserExist) {
        userEntity = await getUserData(uid: user.uid);
      } else {
        shouldDeleteUser = true;
        userEntity = UserModel.fromFirebaseUser(user);
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      if (shouldDeleteUser) {
        await deleteUser(user);
      }
      return left(ServerFailure(e.errMessage));
    } catch (e) {
      if (shouldDeleteUser) {
        await deleteUser(user);
      }
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  // Saves the user's profile into Firestore.
  //
  // Authentication creates only the Auth account.
  // The application's user profile is stored separately.
  //
  // حفظ بيانات المستخدم داخل Firestore
  // لأن Firebase Authentication لا يحتفظ
  // إلا ببيانات تسجيل الدخول.

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  // Fetches the user's profile from Firestore.
  //
  // After successful authentication we already have
  // the Firebase UID.
  //
  // That UID is used as the Firestore document id
  // to retrieve the user's application data.
  //
  // بعد نجاح تسجيل الدخول نحصل على uid من Firebase Auth.
  //
  // ثم نستخدم الـ uid للوصول إلى الـ document
  // الخاص بالمستخدم داخل Firestore واسترجاع بياناته.
  //!-----------------------------------------------------------
  /*
  Why do we fetch data from Firestore after login?

  Firebase Authentication is responsible only for identity
  (uid, email, provider, ...).

  The application's profile data is stored separately
  inside Firestore.

  T herefore, after every successful login,
  we fetch the user's profile using the Firebase uid.

  -------------------------------------------------------

  لماذا نقوم بجلب البيانات من Firestore بعد تسجيل الدخول؟

  لأن Firebase Authentication يحتفظ فقط ببيانات المصادقة،
  بينما بيانات المستخدم الخاصة بالتطبيق محفوظة في Firestore،
  لذلك نستخدم الـ uid لجلب هذه البيانات.
  */

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future<dynamic> saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
