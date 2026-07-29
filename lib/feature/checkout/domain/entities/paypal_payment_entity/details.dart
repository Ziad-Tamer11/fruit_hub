import 'package:equatable/equatable.dart';
import 'package:fruit_hub/feature/checkout/domain/entities/order_entity.dart';

class DetailsEntity extends Equatable {
  final String? subtotal;
  final String? shipping;
  final num? shippingDiscount;

  const DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };

  factory DetailsEntity.fromEntity(OrderEntity orderEntity) {
    return DetailsEntity(
      subtotal: orderEntity.cartEntity.calculateTotalPrice().toString(),
      shipping: orderEntity.calculateShippingCost().toString(),
      shippingDiscount: orderEntity.calculateShippingDiscount(),
    );
  }

  @override
  List<Object?> get props => [subtotal, shipping, shippingDiscount];
}
