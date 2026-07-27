import 'package:fruit_hub/feature/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItemEntity;
  final bool payWithCash;
  final ShippingAddressEntity shippingAddressEntity;
  OrderEntity({
    required this.cartItemEntity,
    required this.payWithCash,
    required this.shippingAddressEntity,
  });
}
