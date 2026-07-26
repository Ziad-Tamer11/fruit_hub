import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/feature/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/cart_item_action_button.dart';

class CartItemAcionButtons extends StatelessWidget {
  const CartItemAcionButtons({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          icon: Icons.add,
          color: AppColors.primaryColor,
          onPressed: () {
            cartItemEntity.increaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          iconColor: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text(
            cartItemEntity.count.toString(),
            style: TextStyles.bold16,
          ),
        ),
        CartItemActionButton(
          icon: Icons.remove,
          color: Color(0xffF3F5F7),
          onPressed: () {
            cartItemEntity.decreaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          iconColor: Color(0xff979899),
        ),
      ],
    );
  }
}
