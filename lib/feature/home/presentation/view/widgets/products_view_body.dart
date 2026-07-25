import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/core/widgets/search_text_field.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/products_view_header.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

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
                child: buildAppBar(
                  context,
                  title: 'المنتجات',
                  showBackButton: false,
                ),
              ),
              const SizedBox(height: kTopPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: SearchTextField(),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: ProductsViewHeader(
                  productsLength: context.read<ProductsCubit>().productLength,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        ProductsGridViewBlocBuilder(),
      ],
    );
  }
}
