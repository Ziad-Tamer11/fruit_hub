class ShippingAddressEntity {
  String? name;
  String? number;
  String? email;
  String? address;
  String? city;
  String? floor;

  ShippingAddressEntity({
    this.name,
    this.number,
    this.email,
    this.address,
    this.city,
    this.floor,
  });

  String toString() {
    return '$address $city $floor';
  }
}
