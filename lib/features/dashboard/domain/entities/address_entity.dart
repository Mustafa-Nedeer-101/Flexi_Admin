class AddressEntity {
  AddressEntity(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.street,
      required this.postalCode,
      required this.city,
      required this.state,
      required this.country,
      this.dateTime,
      this.isSelectedAddress = true});

  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String postalCode;
  final String city;
  final String state;
  final String country;
  final DateTime? dateTime;
  bool isSelectedAddress;
}
