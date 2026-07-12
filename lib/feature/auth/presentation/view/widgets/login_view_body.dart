import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/core/widgets/or_divider.dart';
import 'package:fruit_hub/feature/auth/presentation/view/widgets/dont_have_account.dart';
import 'package:fruit_hub/feature/auth/presentation/view/widgets/social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'نسيت كلمة المرور؟',
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 33),
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
            const SizedBox(height: 33),
            const DontHaveAccount(),
            const SizedBox(height: 33),
            const OrDivider(),
            const SizedBox(height: 16),
            SocialLoginButton(
              onPressed: () {},
              text: 'تسجيل الدخول باستخدام جوجل',
              image: Assets.imagesGoogleIcon,
            ),
            const SizedBox(height: 16),

            SocialLoginButton(
              onPressed: () {},
              text: 'تسجيل بواسطة أبل',
              image: Assets.imagesAppleIcon,
            ),
            const SizedBox(height: 16),

            SocialLoginButton(
              onPressed: () {},
              text: 'تسجيل بواسطة فيسبوك',
              image: Assets.imagesFacebookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
