import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/best_selling_header.dart';

class BestSellingFruitsViewBody extends StatelessWidget {
  const BestSellingFruitsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: BestSellingHeader(),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
