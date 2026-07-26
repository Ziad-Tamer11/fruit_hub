import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItemEntity});

  final List<CartItemEntity> cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItemEntity.length,
      separatorBuilder: (context, index) => CustomDivider(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CartItem(cartItemEntity: cartItemEntity[index]),
        );
      },
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: Color(0xFFF1F1F5), thickness: 1, height: 22);
  }
}
