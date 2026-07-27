import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/checkout_view_body.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_item_entity.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartItem});

  static const routeName = 'checkout';
  final List<CartItemEntity> cartItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: CheckoutViewBody()));
  }
}
