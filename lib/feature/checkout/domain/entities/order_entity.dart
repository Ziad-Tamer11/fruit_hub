import 'package:fruit_hub/feature/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity();
  OrderEntity({required this.cartEntity, this.payWithCash, required this.uId});

  num calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    }
    return 0;
  }

  num calculateShippingDiscount() {
    return 0;
  }

  num calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }
}
