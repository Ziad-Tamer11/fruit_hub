import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/helper/get_currency.dart';
import 'package:fruit_hub/feature/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class AmountEntity extends Equatable {
  final String? total;
  final String? currency;
  final DetailsEntity? details;

  const AmountEntity({this.total, this.currency, this.details});

  factory AmountEntity.fromEntity(OrderEntity orderEntity) {
    return AmountEntity(
      total: orderEntity
          .calculateTotalPriceAfterDiscountAndShipping()
          .toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(orderEntity),
    );
  }

  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };

  @override
  List<Object?> get props => [total, currency, details];
}
