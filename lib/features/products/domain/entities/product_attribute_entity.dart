import 'package:admin/features/products/data/models/product_attribute_model.dart';

class ProductAttributeEntity {
  String? name;
  final List<String>? values;

  ProductAttributeEntity({this.name, required this.values});

  ProductAttributeModel toModel() =>
      ProductAttributeModel(name: name, values: values);
}
