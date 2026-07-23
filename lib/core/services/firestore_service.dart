import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/database_service.dart';

/// Concrete implementation of DatabaseService using Cloud Firestore.
///
/// جميع عمليات حفظ وقراءة البيانات من Firestore تتم من خلال هذا الكلاس.

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Saves data inside a Firestore collection.
  //
  // If documentId is provided:
  // users/{documentId}
  //
  // Otherwise Firestore generates a random document id.
  //
  // حفظ البيانات داخل Firestore.
  // إذا كان هناك documentId سيتم استخدامه.
  // وإلا سيقوم Firestore بإنشاء id تلقائياً.

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String? documentId,
  }) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  // Fetches a single document from Firestore.
  //
  // Example:
  // users/abc123
  //
  // Returns the document data as a Map<String, dynamic>
  // so it can later be converted into UserModel.
  //
  // جلب بيانات مستخدم واحد من Firestore
  // ثم إرجاعها على هيئة Map ليتم تحويلها إلى UserModel.

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          data = data.orderBy(
            query['orderBy'],
            descending: query['descending'] ?? false,
          );
        }
        if (query['limit'] != null) {
          data = data.limit(query['limit']);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  // Checks whether a Firestore document already exists.
  //
  // Used after Google/Facebook authentication
  // to determine whether this is a new user
  // or an existing one.
  //
  // التحقق من وجود بيانات المستخدم داخل Firestore
  // لمعرفة هل هذه أول مرة يسجل الدخول أم لا.

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
