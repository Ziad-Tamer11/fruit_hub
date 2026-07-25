import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/best_selling_header.dart';
import 'package:fruit_hub/feature/best_selling_fruits/presentation/view/widgets/best_selling_fruits_bloc_builder.dart';

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
        BestSellingFruitsBodyBlocBuilder(),
      ],
    );
  }
}
