import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/template/data/repositories/products_repo.dart';
import 'package:admin/features/template/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

class FetchProductsUsecase {
  final ProductsRepo repo;

  FetchProductsUsecase({required this.repo});

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await repo.getfeaturedProducts();
  }
}
