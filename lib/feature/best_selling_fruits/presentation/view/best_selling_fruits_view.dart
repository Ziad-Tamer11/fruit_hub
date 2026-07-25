import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/feature/best_selling_fruits/presentation/view/widgets/best_Selling_fruits_body.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});

  static const routeName = 'best_selling_fruits';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(productsRepo: getIt.get<ProductsRepo>())
            ..getBestSellingProducts(),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
        body: SafeArea(child: BestSellingFruitsViewBody()),
      ),
    );
  }
}
