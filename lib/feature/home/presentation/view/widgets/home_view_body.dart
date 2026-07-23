import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/widgets/best_selling_header.dart';
import 'package:fruit_hub/core/widgets/search_text_field.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

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
        BestSellingGridViewBlocBuilder(),
      ],
    );
  }
}
