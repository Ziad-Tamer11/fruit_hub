import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';

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
      if (e.code == 'weak-password') {
        throw CustomException(errMessage: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          errMessage: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.',
        );
      } else {
        throw CustomException(
          errMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        );
      }
    } catch (e) {
      throw CustomException(
        errMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      );
    }
  }
}
