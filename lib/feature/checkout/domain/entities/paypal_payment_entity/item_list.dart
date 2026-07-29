import 'package:equatable/equatable.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_item_entity.dart';

import 'item.dart';

class ItemList extends Equatable {
  final List<ItemEntity>? items;

  const ItemList({this.items});

  factory ItemList.fromEntity(List<CartItemEntity> item) {
    return ItemList(items: item.map((e) => ItemEntity.fromEntity(e)).toList());
  }

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [items];
}
