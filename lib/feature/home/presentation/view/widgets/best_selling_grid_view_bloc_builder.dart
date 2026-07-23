import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/helper/get_dummy_product.dart';
import 'package:fruit_hub/core/widgets/best_selling_grid_view.dart';
import 'package:fruit_hub/core/widgets/custom_error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          print('Products Count: ${state.products.length}');

          return SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: kHorizontalPadding,
            ),
            sliver: BestSellingGridView(products: state.products),
          );
        }
        if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errMessage),
          );
        } else {
          return SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: kHorizontalPadding,
            ),
            sliver: Skeletonizer.sliver(
              enabled: true,
              child: BestSellingGridView(products: getDummyProducts()),
            ),
          );
        }
      },
    );
  }
}
