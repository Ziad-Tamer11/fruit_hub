import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

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
              children: [
                Row(
                  children: [
                    Text('بطيخ', style: TextStyles.bold13),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.imagesTrash),
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
