import 'package:admin/features/template/domain/entities/product_attribute_entity.dart';

class ProductAttributeModel extends ProductAttributeEntity {
  ProductAttributeModel({super.name, super.values});

  // Empty Helper Function
  static ProductAttributeModel empty() =>
      ProductAttributeModel(name: '', values: []);

  // convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  // Map Json oriented document snapshot from firestore
  factory ProductAttributeModel.instance(
      Map<String, dynamic> documentSnapshot) {
    if (documentSnapshot.isNotEmpty) {
      return ProductAttributeModel(
          name: documentSnapshot.containsKey('Name')
              ? documentSnapshot['Name']
              : '',
          values: List<String>.from(documentSnapshot['Values']));
    } else {
      return ProductAttributeModel.empty();
    }
  }
}
