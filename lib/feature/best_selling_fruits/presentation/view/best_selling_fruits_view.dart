import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/feature/best_selling_fruits/presentation/view/widgets/best_Selling_fruits_body.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});

  static const routeName = 'best_selling_fruits';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
      body: SafeArea(child: BestSellingFruitsViewBody()),
    );
  }
}
