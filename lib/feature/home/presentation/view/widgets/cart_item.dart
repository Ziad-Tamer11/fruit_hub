import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/cart_item_acion_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: BoxDecoration(color: const Color(0xFFF3F5F7)),
            child: Image.asset(Assets.imagesWatermelonTest),
          ),
          SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('بطيخ', style: TextStyles.bold13),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.imagesTrash),
                    ),
                  ],
                ),
                Text(
                  '3 كم',
                  style: TextStyles.regular13.copyWith(
                    color: const Color(0xFFF4A91F) /* Orange-500 */,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    CartItemAcionButtons(),
                    Spacer(),
                    Text(
                      '60 جنيه',
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
