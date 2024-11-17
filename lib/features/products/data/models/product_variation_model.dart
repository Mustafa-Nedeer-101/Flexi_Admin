import 'package:admin/features/products/domain/entities/product_variation_entity.dart';

class ProductVariationModel extends ProductVariationEntity {
  ProductVariationModel({
    required super.id,
    super.sku = '',
    super.image = '',
    super.description = '',
    super.price = 0.0,
    super.salePrice = 0.0,
    super.stock = 0,
    required super.attributeValues,
  });

  // Empty Helper Function
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  // convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  // Map Json oriented document snapshot from firestore
  factory ProductVariationModel.instance(
      Map<String, dynamic> documentSnapshot) {
    if (documentSnapshot.isNotEmpty) {
      return ProductVariationModel(
          id: documentSnapshot['Id'] ?? '',
          price: double.parse((documentSnapshot['Price'] ?? 0.0).toString()),
          sku: documentSnapshot['SKU'] ?? '',
          stock: documentSnapshot['Stock'] ?? 0,
          salePrice:
              double.parse((documentSnapshot['SalePrice'] ?? 0.0).toString()),
          image: documentSnapshot['Image'] ?? '', // Testing
          attributeValues:
              Map<String, String>.from(documentSnapshot['AttributeValues']));
    } else {
      return ProductVariationModel.empty();
    }
  }
}
