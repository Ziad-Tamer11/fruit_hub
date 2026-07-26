import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_network_image.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/cart_item_acion_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: BoxDecoration(color: const Color(0xFFF3F5F7)),
            child: CustomNetworkImage(
              imageUrl: cartItemEntity.productEntity.imageUrl!,
            ),
          ),
          SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      cartItemEntity.productEntity.name,
                      style: TextStyles.bold13,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().removeCartItem(
                          cartItemEntity,
                        );
                      },
                      child: SvgPicture.asset(Assets.imagesTrash),
                    ),
                  ],
                ),
                Text(
                  '${cartItemEntity.calculateTotalWeight()} كم',
                  style: TextStyles.regular13.copyWith(
                    color: const Color(0xFFF4A91F) /* Orange-500 */,
                  ),
                ),
                Row(
                  children: [
                    CartItemAcionButtons(cartItemEntity: cartItemEntity),
                    Spacer(),
                    Text(
                      '${cartItemEntity.calculateTotalPrice()} جنيه',
                      style: TextStyles.bold16.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
