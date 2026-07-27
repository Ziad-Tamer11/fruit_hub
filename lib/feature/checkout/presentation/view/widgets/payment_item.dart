import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_decoration.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});

  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.bold13),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 128,
          decoration: AppDecoration.greyBoxDecoration,
          child: child,
        ),
      ],
    );
  }
}
