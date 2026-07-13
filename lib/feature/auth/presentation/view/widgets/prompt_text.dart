import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class PromptText extends StatelessWidget {
  const PromptText({
    super.key,
    required this.onTap,
    required this.text1,
    required this.text2,
  });
  final void Function() onTap;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF616A6B) /* Grayscale-400 */,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: text2,
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor /* Green1-500 */,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
