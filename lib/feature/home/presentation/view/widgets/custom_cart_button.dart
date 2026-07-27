import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/checkout_view.dart';
import 'package:fruit_hub/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              CheckoutView.routeName,
              arguments: context.read<CartCubit>().cartEntity.cartItems,
            );
          },
          text:
              'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
        );
      },
    );
  }
}
