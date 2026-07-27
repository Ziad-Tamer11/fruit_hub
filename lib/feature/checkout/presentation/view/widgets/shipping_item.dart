import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
  });

  final String title, subTitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 13, right: 28, bottom: 16),
      decoration: ShapeDecoration(
        color: const Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                    width: 2,
                    color: const Color(0xFF949D9E) /* Grayscale-400 */,
                  ),
                ),
              ),
            ),
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
    );
  }
}
