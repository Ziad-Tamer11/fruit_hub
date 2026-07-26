import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFF2F3F3) /* Green1-500 */,
          radius: 10,
          child: Text('2', style: TextStyles.semiBold13),
        ),
        SizedBox(width: 4),
        Text(
          'العنوان',
          style: TextStyles.bold13.copyWith(color: Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}
