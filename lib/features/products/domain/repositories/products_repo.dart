import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/products/domain/entities/product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract interface class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getfeaturedProducts();

  Future<Either<Failure, List<ProductEntity>>> getProductsByQuery(Query query);

  Future<Either<Failure, List<ProductEntity>>> getProductsforCategory(
      {required String categoryId, int limit = -1});

  Future<Either<Failure, void>> uploadProducts(List<ProductEntity> products);

  Future<Either<Failure, List<ProductEntity>>> getFavouritProducts(
      List<String> productIds);
}
