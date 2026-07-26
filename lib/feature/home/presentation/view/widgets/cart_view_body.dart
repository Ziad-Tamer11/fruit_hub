import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/cart_header.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/cart_item_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
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
            SliverToBoxAdapter(child: CustomDivider()),
            CartItemList(),
            SliverToBoxAdapter(child: CustomDivider()),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .05,
          child: CustomButton(onPressed: () {}, text: 'الدفع  120جنيه'),
        ),
      ],
    );
  }
}
