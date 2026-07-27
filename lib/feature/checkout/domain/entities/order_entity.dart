import 'package:fruit_hub/feature/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity();
  OrderEntity({required this.cartEntity, this.payWithCash});
}
