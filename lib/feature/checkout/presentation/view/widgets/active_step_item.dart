import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFF1B5E37) /* Green1-500 */,
          radius: 11.5,
          child: FittedBox(
            child: Icon(Icons.check_rounded, color: Colors.white, size: 18),
          ),
        ),
        SizedBox(width: 4),
        Text(
          'الشحن',
          style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
