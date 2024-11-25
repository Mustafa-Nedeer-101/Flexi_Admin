import 'package:admin/features/dashboard/domain/entities/cart_item_model.dart';

class CartItemModel extends CartItemEntity {
  // constructor
  CartItemModel(
      {required super.productId,
      super.title = '',
      super.price = 0.0,
      super.image,
      required super.quantity,
      super.variationId = '',
      super.brandName,
      super.selectedVariaition});

  // Empty Cart Item
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  // to JSON
  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'Title': title,
      'Price': price,
      'Image': image,
      'Quantity': quantity,
      'VariationId': variationId,
      'BrandName': brandName,
      'SelectedVariation': selectedVariaition,
    };
  }

  factory CartItemModel.fromEntity(CartItemEntity? entity) {
    if (entity == null) {
      return CartItemModel.empty();
    } else {
      return CartItemModel(
          productId: entity.productId,
          quantity: entity.quantity,
          title: entity.title,
          price: entity.price,
          image: entity.image,
          variationId: entity.variationId,
          brandName: entity.brandName,
          selectedVariaition: entity.selectedVariaition);
    }
  }

  // From document snapshot
  factory CartItemModel.instanceFromDocumentSnapshot(
      Map<String, dynamic> json) {
    return CartItemModel(
        productId: json['ProductId'] ?? '',
        title: json["Title"],
        price: json['Price']?.toDouble(),
        image: json['Image'],
        quantity: json['Quantity'] ?? 0,
        variationId: json['VariationId'],
        brandName: json['BrandName'],
        selectedVariaition: json['SelectedVariation'] != null
            ? Map<String, String>.from(json['SelectedVariation'])
            : null);
  }
}
