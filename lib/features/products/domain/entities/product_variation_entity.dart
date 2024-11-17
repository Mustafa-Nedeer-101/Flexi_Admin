import 'package:admin/features/products/data/models/product_variation_model.dart';

class ProductVariationEntity {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationEntity({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  ProductVariationModel toModel() => ProductVariationModel(
        id: id,
        sku: sku,
        image: image,
        description: description,
        price: price,
        salePrice: salePrice,
        stock: stock,
        attributeValues: attributeValues,
      );
}
