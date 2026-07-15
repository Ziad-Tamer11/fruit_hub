import 'package:fruit_hub/feature/auth/domain/entities/user_entity.dart';

abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });
  Future<UserEntity> getUserData({required String path, required String uid});
}
