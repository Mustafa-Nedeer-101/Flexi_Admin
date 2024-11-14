import 'package:admin/features/template/data/models/brand_model.dart';

class BrandEntity {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandEntity({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  BrandModel toModel() => BrandModel(
      id: id,
      image: image,
      name: name,
      isFeatured: isFeatured,
      productsCount: productsCount);
}
