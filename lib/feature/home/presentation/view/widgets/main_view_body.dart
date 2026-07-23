import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/home/presentation/view/products_view.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        ProductsView(),
        Placeholder(),
        Placeholder(),
      ],
    );
  }
}
