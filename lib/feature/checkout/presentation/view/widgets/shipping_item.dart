import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/active_shipping_item_dot.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/in_active_shipping_item_dot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    this.onTap,
  });

  final String title, subTitle;
  final String price;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child: Container(
          padding: const EdgeInsets.only(
            top: 16,
            left: 13,
            right: 28,
            bottom: 16,
          ),
          decoration: ShapeDecoration(
            color: isSelected ? Colors.white : const Color(0x33D9D9D9),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isSelected
                    ? ActiveShippingItemDot()
                    : InActiveShippingItemDot(),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyles.semiBold13),
                    SizedBox(height: 6),
                    Text(
                      subTitle,
                      textAlign: TextAlign.right,
                      style: TextStyles.regular13.copyWith(
                        color: Colors.black.withValues(alpha: 0.50),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    '$price جنيه',
                    style: TextStyles.bold13.copyWith(
                      color: const Color(0xFF3A8B33),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
