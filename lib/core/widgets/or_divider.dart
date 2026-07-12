import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDCDEDE), thickness: 1)),
        const SizedBox(width: 17.83),
        Text('أو', style: TextStyles.semiBold16),
        const SizedBox(width: 18.88),
        Expanded(child: Divider(color: Color(0xFFDCDEDE), thickness: 1)),
      ],
    );
  }
}
