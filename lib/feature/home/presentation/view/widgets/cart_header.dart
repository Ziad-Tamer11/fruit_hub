import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: const Color(0xFFEBF9F1) /* Green1-50 */),
      child: Center(
        child: Text(
          'لديك 3 منتجات في سله التسوق',
          style: TextStyles.regular13.copyWith(
            color: AppColors.primaryColor /* Green1-500 */,
          ),
        ),
      ),
    );
  }
}
