import 'package:admin/features/dashboard/domain/entities/address_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel extends AddressEntity {
  AddressModel(
      {required super.id,
      required super.name,
      required super.phoneNumber,
      required super.street,
      required super.postalCode,
      required super.city,
      required super.state,
      required super.country,
      super.dateTime,
      super.isSelectedAddress = true});

  static AddressModel empty() {
    return AddressModel(
        id: '',
        name: '',
        phoneNumber: '',
        street: '',
        postalCode: '',
        city: '',
        state: '',
        country: '');
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Street': street,
      'PostalCode': postalCode,
      'City': city,
      'State': state,
      'Country': country,
      'DateTime': DateTime.now(),
      'IsSelectedAddress': isSelectedAddress,
    };
  }

  factory AddressModel.fromEntity(AddressEntity? entity) {
    if (entity == null) {
      return AddressModel.empty();
    } else {
      return AddressModel(
          id: entity.id,
          name: entity.name,
          phoneNumber: entity.phoneNumber,
          street: entity.street,
          postalCode: entity.postalCode,
          city: entity.city,
          state: entity.state,
          country: entity.country,
          dateTime: entity.dateTime,
          isSelectedAddress: entity.isSelectedAddress);
    }
  }

  factory AddressModel.instanceFromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data['Id'] as String,
      name: data['Name'] as String,
      phoneNumber: data['PhoneNumber'] as String,
      street: data['Street'] as String,
      postalCode: data['PostalCode'] as String,
      city: data['City'] as String,
      state: data['State'] as String,
      country: data['Country'] as String,
      dateTime: (data['DateTime'] as Timestamp).toDate(),
      isSelectedAddress: data['IsSelectedAddress'] as bool,
    );
  }

  // Document Snapshot
  factory AddressModel.instanceFromDocumentSnapshot(
      DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;

    return AddressModel(
      id: data['Id'],
      name: data['Name'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      street: data['Street'] ?? '',
      postalCode: data['PostalCode'] ?? '',
      city: data['City'] ?? '',
      state: data['State'] ?? '',
      country: data['Country'] ?? '',
      dateTime: (data['DateTime'] as Timestamp).toDate(),
      isSelectedAddress: data['IsSelectedAddress'] as bool,
    );
  }

  @override
  String toString() {
    return '$street, $city, $state, $postalCode, $country';
  }
}
