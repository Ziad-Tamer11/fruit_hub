import 'package:equatable/equatable.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity extends Equatable {
  final AmountEntity? amount;
  final String? description;
  final ItemList? itemList;

  const PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(
    PaypalPaymentEntity paypalPaymentEntity,
  ) {
    return PaypalPaymentEntity(
      amount: paypalPaymentEntity.amount,
      description: paypalPaymentEntity.description,
      itemList: paypalPaymentEntity.itemList,
    );
  }
  @override
  List<Object?> get props => [amount, description, itemList];
}
