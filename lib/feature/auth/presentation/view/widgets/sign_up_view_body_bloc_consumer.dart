import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/feature/auth/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:fruit_hub/feature/auth/presentation/view/widgets/sign_up_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SignUpViewBody();
      },
    );
  }
}
