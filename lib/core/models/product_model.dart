import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/helper/get_avg_rating.dart';

import 'review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount = 0;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;
  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    required this.price,
    this.sellingCount = 0,
    required this.isOrganic,
    required this.isFeatured,
    this.imageUrl,
    required this.avgRating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviews = (json['reviews'] as List<dynamic>? ?? [])
        .map((e) => ReviewModel.fromJson(e))
        .toList();

    return ProductModel(
      reviews: reviews,
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      isOrganic: json['isOrganic'],
      expirationsMonths: json['expirationsMonths'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      sellingCount: json['sellingCount'] ?? 0,
      avgRating: reviews.isEmpty ? 0 : getAvgRating(reviews),
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      isOrganic: isOrganic,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'sellingCount': sellingCount,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
