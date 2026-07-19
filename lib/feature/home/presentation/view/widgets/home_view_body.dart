import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/search_text_field.dart';
import 'package:fruit_hub/core/widgets/best_selling_grid_view.dart';
import 'package:fruit_hub/core/widgets/best_selling_header.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: CustomHomeAppBar(),
              ),
              const SizedBox(height: kTopPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: SearchTextField(),
              ),
              const SizedBox(height: 12),
              FeaturedList(),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: BestSellingHeader(text: 'المزيد'),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: kHorizontalPadding),
          sliver: BestSellingGridView(itemCount: 6),
        ),
      ],
    );
  }
}
