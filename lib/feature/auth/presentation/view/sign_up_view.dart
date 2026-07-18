import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/feature/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_hub/feature/auth/presentation/view/widgets/sign_up_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(authRepo: getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildCustomAppBar(context, title: 'حساب جديد'),
        body: SafeArea(child: const SignUpViewBodyBlocConsumer()),
      ),
    );
  }
}
