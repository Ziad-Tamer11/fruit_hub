import 'package:fruit_hub/feature/checkout/data/model/order_product_model.dart';
import 'package:fruit_hub/feature/checkout/data/model/shipping_model.dart';
import 'package:fruit_hub/feature/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final num totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
      uId: orderEntity.uId,
      shippingAddressModel: ShippingAddressModel.fromEntity(
        orderEntity.shippingAddressEntity,
      ),
      orderProducts: orderEntity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(e))
          .toList(),
      paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'PayPal',
    );
  }

  toJson() {
    return {
      'uId': uId,
      'totalPrice': totalPrice,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
