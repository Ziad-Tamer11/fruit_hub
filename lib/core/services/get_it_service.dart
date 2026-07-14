import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()),
  );
}
