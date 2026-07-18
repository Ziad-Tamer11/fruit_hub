import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/feature/auth/presentation/manager/sign_in_cubit/login_cubit.dart';
import 'package:fruit_hub/feature/auth/presentation/view/widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepo: getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildCustomAppBar(context, title: 'تسجيل دخول'),
        body: SafeArea(child: LoginViewBodyBlocConsumer()),
      ),
    );
  }
}
