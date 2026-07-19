/// Represents the authenticated user inside the Domain Layer.
///
/// This entity contains only the business data required by the app
/// without depending on Firebase or Firestore.
///
/// يمثل بيانات المستخدم داخل الـ Domain Layer
/// بدون أي اعتماد على Firebase.
///
class UserEntity {
  final String name;
  final String email;
  final String uId;

  UserEntity({required this.name, required this.email, required this.uId});
}
