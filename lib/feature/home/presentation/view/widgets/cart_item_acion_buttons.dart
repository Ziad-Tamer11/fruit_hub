import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/cart_item_action_button.dart';

class CartItemAcionButtons extends StatelessWidget {
  const CartItemAcionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          icon: Icons.add,
          color: AppColors.primaryColor,
          onPressed: () {},
          iconColor: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text('3', style: TextStyles.bold16),
        ),
        CartItemActionButton(
          icon: Icons.remove,
          color: Color(0xffF3F5F7),
          onPressed: () {},
          iconColor: Color(0xff979899),
        ),
      ],
    );
  }
}
