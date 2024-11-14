import 'package:admin/core/utils/errors/error_handler.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/template/data/datasources/products_remote_datasource.dart';
import 'package:admin/features/template/data/models/product_model.dart';
import 'package:admin/features/template/domain/entities/product_entity.dart';
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

class ProductsRepoImp implements ProductsRepo {
  final ProductsRemoteDatasource datasource;

  ProductsRepoImp({required this.datasource});

  @override
  Future<Either<Failure, List<ProductModel>>> getFavouritProducts(
      List<String> productIds) async {
    try {
      final result = await datasource.getFavouritProducts(productIds);

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsByQuery(
      Query<Object?> query) async {
    try {
      final result = await datasource.getProductsByQuery(query);

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsforCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      final result = await datasource.getProductsforCategory(
          categoryId: categoryId, limit: limit);

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getfeaturedProducts() async {
    try {
      final result = await datasource.getfeaturedProducts();

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> uploadProducts(
      List<ProductEntity> products) async {
    try {
      final result = await datasource
          .uploadProducts(products.map((p) => p.toModel()).toList());

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }
}
