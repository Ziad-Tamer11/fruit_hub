import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/feature/auth/presentation/view/widgets/custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            setState(() {
              isTermsAccepted = value;
            });
          },
        ),
        SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E) /* Grayscale-400 */,
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor /* Green1-600 */,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF616A6B) /* Grayscale-600 */,
                  ),
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor /* Green1-600 */,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF616A6B) /* Grayscale-600 */,
                  ),
                ),
                TextSpan(
                  text: 'بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor /* Green1-600 */,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
