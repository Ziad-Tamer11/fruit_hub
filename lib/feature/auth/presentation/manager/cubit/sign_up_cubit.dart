import 'package:bloc/bloc.dart';
import 'package:fruit_hub/feature/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    emit(SignUpLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      name,
      email,
      password,
    );
    result.fold(
      (failure) => emit(SignUpFailure(errMessage: failure.errMessage)),
      (userEntity) => emit(SignUpSuccess(userEntity: userEntity)),
    );
  }
}
