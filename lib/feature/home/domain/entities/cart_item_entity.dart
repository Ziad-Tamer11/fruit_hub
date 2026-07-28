import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  int increaseQuantity() {
    return quantity++;
  }

  int decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
    }
    return quantity;
  }

  @override
  List<Object?> get props => [productEntity];
}
