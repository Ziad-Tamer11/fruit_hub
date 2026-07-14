import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}",
      );
      if (e.code == 'weak-password') {
        throw CustomException(errMessage: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          errMessage: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(errMessage: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
          errMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}",
      );
      throw CustomException(
        errMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      );
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}",
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          errMessage: 'البريد الإلكتروني أو الرقم السري غير صحيح.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          errMessage: 'البريد الإلكتروني أو الرقم السري غير صحيح.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(errMessage: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
          errMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}",
      );
      throw CustomException(
        errMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      );
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignIn signIn = GoogleSignIn.instance;

    await signIn.initialize();

    final GoogleSignInAccount googleUser = await signIn.authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
