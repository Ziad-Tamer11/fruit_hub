import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/build_error_bar.dart';
import 'package:fruit_hub/feature/auth/presentation/manager/sign_in_cubit/login_cubit.dart';
import 'package:fruit_hub/feature/auth/presentation/view/widgets/login_view_body.dart';
import 'package:fruit_hub/feature/home/presentation/view/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          buildMessageBar(context, 'تم تسجيل الدخول بنجاح.');
          Navigator.pushNamed(context, HomeView.routeName);
        }
        if (state is LoginFailure) {
          buildMessageBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
