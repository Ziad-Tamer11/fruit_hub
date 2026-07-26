import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/feature/home/presentation/manager/cubit/cart_cubit.dart';
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
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? SizedBox()
                  : CustomDivider(),
            ),
            CartItemList(
              cartItemEntity: context.read<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? SizedBox()
                  : CustomDivider(),
            ),
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
