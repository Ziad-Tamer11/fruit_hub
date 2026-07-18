import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/feature/best_selling_fruits/presentation/view/best_selling_fruits_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('الأكثر مبيعًا', style: TextStyles.bold16),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, BestSellingFruitsView.routeName);
          },
          child: Text(
            'المزيد',

            style: TextStyles.regular13.copyWith(color: Color(0xFF949D9E)),
          ),
        ),
      ],
    );
  }
}
