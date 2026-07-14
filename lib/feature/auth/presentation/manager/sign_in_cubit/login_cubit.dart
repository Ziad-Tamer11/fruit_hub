import 'package:bloc/bloc.dart';
import 'package:fruit_hub/feature/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(LoginFailure(errMessage: failure.errMessage)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}
