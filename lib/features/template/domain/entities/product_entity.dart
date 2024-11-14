import 'package:admin/features/template/data/models/product_model.dart';
import 'package:admin/features/template/domain/entities/brand_entity.dart';
import 'package:admin/features/template/domain/entities/product_attribute_entity.dart';
import 'package:admin/features/template/domain/entities/product_variation_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductEntity {
  String id;
  String title;
  int stock;
  double price;
  String? sku;
  Timestamp? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandEntity? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeEntity>? productAttributes;
  List<ProductVariationEntity>? productVariations;

  ProductEntity(
      {required this.id,
      required this.title,
      required this.stock,
      required this.price,
      this.sku,
      this.date,
      this.salePrice = 0.0,
      required this.thumbnail,
      this.isFeatured,
      this.brand,
      this.description,
      this.categoryId,
      this.images,
      required this.productType,
      this.productAttributes,
      this.productVariations});

  ProductModel toModel() => ProductModel(
      id: id,
      title: title,
      stock: stock,
      price: price,
      sku: sku,
      date: date,
      salePrice: salePrice,
      thumbnail: thumbnail,
      isFeatured: isFeatured,
      brand: brand,
      description: description,
      categoryId: categoryId,
      images: images,
      productAttributes: productAttributes,
      productVariations: productVariations,
      productType: productType);
}
