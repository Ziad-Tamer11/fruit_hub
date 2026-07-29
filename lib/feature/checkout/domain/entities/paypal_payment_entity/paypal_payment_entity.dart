import 'package:equatable/equatable.dart';
import 'package:fruit_hub/feature/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity extends Equatable {
  final AmountEntity? amount;
  final String? description;
  final ItemList? itemList;

  const PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderEntity orderEntity) {
    return PaypalPaymentEntity(
      amount: AmountEntity.fromEntity(orderEntity),
      description: 'Pamyment Description',
      itemList: ItemList.fromEntity(orderEntity.cartEntity.cartItems),
    );
  }

  toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'itemList': itemList?.toJson(),
  };
  @override
  List<Object?> get props => [amount, description, itemList];
}
