import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({
    super.key,
    required this.products,
    this.itemCount,
  });
  final List<ProductEntity> products;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: itemCount ?? products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return FruitItem(productEntity: products[index]);
      },
    );
  }
}
