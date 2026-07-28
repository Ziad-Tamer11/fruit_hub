import 'package:fruit_hub/feature/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? number;
  String? email;
  String? address;
  String? city;
  String? floor;

  ShippingAddressModel({
    this.name,
    this.number,
    this.email,
    this.address,
    this.city,
    this.floor,
  });

  factory ShippingAddressModel.fromEntity(
    ShippingAddressEntity shippingAddressEntity,
  ) {
    return ShippingAddressModel(
      name: shippingAddressEntity.name,
      address: shippingAddressEntity.address,
      city: shippingAddressEntity.city,
      email: shippingAddressEntity.email,
      floor: shippingAddressEntity.floor,
      number: shippingAddressEntity.number,
    );
  }

  String toString() {
    return '$address $city $floor';
  }

  toJson() {
    return {
      'name': name,
      'address': address,
      'number': number,
      'floor': floor,
      'email': email,
      'city': city,
    };
  }
}
