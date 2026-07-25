import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/cart_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

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
                child: buildCustomAppBar(context, title: 'السلة'),
              ),
              const SizedBox(height: kTopPadding),
              CartHeader(),
              const SizedBox(height: 23),
            ],
          ),
        ),
      ],
    );
  }
}
