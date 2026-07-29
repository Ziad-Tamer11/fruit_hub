import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/helper/get_currency.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_item_entity.dart';

class ItemEntity extends Equatable {
  final String? name;
  final int? quantity;
  final String? price;
  final String? currency;

  const ItemEntity({this.name, this.quantity, this.price, this.currency});

  factory ItemEntity.fromEntity(CartItemEntity cartItemEntity) {
    return ItemEntity(
      name: cartItemEntity.productEntity.name,
      quantity: cartItemEntity.quantity,
      price: cartItemEntity.productEntity.price.toString(),
      currency: getCurrency(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };

  @override
  List<Object?> get props => [name, quantity, price, currency];
}
