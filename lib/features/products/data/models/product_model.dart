import 'package:admin/features/products/data/models/brand_model.dart';
import 'package:admin/features/products/data/models/product_attribute_model.dart';
import 'package:admin/features/products/data/models/product_variation_model.dart';
import 'package:admin/features/products/domain/entities/product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id,
      required super.title,
      required super.stock,
      required super.price,
      super.sku,
      super.date,
      super.salePrice = 0.0,
      required super.thumbnail,
      super.isFeatured,
      super.brand,
      super.description,
      super.categoryId,
      super.images,
      required super.productType,
      super.productAttributes,
      super.productVariations});
  // Empty Helper Function
  static ProductModel empty() => ProductModel(
      id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');

  // convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    final productAttributesJson = productAttributes
            ?.map((attribute) => attribute.toModel().toJson())
            .toList() ??
        [];

    final productVariationsJson = productVariations
            ?.map((variation) => variation.toModel().toJson())
            .toList() ??
        [];

    final brandJson = brand?.toModel().toJson();

    Map<String, dynamic> json = {
      'Id': id,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'SKU': sku,
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'Date': date,
      'IsFeatured': isFeatured,
      'Brand': brandJson,
      'Description': description,
      'CategoryId': categoryId,
      'Images': images,
      'ProductType': productType,
      'ProductAttributes':
          productAttributesJson, // List of ProductAttributesModel => Json
      'ProductVariations':
          productVariationsJson, // List of ProductVariationModel => Json
    };

    return json;
  }

  // Map Json oriented (document) snapshot from firestore
  factory ProductModel.instanceFromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;

      return ProductModel(
        id: documentSnapshot['Id'] ?? '',
        sku: data['SKU'],
        title: data['Title'],
        stock: data['Stock'] ?? 0,
        date: data['Date'] ?? DateTime.now(),
        isFeatured: data['IsFeatured'] ?? false,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        productType: data['ProductType'] ?? '',
        brand: BrandModel.instance(data['Brand']),
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        productAttributes: (data['ProductAttributes'] as List<dynamic>)
            .map((e) => ProductAttributeModel.instance(e))
            .toList(),
        productVariations: (data['ProductVariations'] as List<dynamic>)
            .map((e) => ProductVariationModel.instance(e))
            .toList(),
      );
    } else {
      return ProductModel.empty();
    }
  }

  // Map Json oriented (query) snapshot from firestore
  factory ProductModel.instanceFromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();

    // Data is empty
    if (data.isEmpty) {
      return ProductModel.empty();
    }

    return ProductModel(
      id: documentSnapshot['Id'] ?? '',
      sku: data['SKU'],
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      date: data['Date'] as Timestamp,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.instance(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.instance(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.instance(e))
          .toList(),
    );
  }
}
