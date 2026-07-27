import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      padding: EdgeInsets.all(1),
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(width: 2, color: Colors.white /* Grayscale-400 */),
        ),
      ),
      child: Container(
        width: 18,
        height: 18,
        decoration: ShapeDecoration(
          shape: OvalBorder(),
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
