import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/best_selling_grid_view.dart';
import 'package:fruit_hub/core/widgets/best_selling_header.dart';

class BestSellingFruitsViewBody extends StatelessWidget {
  const BestSellingFruitsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: BestSellingHeader(),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: kHorizontalPadding),
          sliver: BestSellingGridView(products: []),
        ),
      ],
    );
  }
}
