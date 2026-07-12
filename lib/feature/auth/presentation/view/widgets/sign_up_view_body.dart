import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/feature/auth/presentation/view/widgets/dont_have_account.dart';
import 'package:fruit_hub/feature/auth/presentation/view/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
            ),
            const SizedBox(height: 16),
            const TermsAndConditions(),
            const SizedBox(height: 30),
            CustomButton(onPressed: () {}, text: 'إنشاء حساب جديد'),
            SizedBox(height: 26),
            DontHaveAccount(
              onTap: () {
                Navigator.of(context).pop();
              },
              text1: 'تمتلك حساب بالفعل؟ ',
              text2: 'تسجيل دخول',
            ),
          ],
        ),
      ),
    );
  }
}
