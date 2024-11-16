part of 'products_cubit.dart';

@immutable
sealed class ProductsState {
  final ProductsStateData data;

  const ProductsState({required this.data});
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading({required super.data});
}

final class ProductsSuccess extends ProductsState {
  const ProductsSuccess({required super.data});
}

final class ProductsFailure extends ProductsState {
  const ProductsFailure({required super.data});
}

class ProductsStateData {
  final List<ProductEntity> products;

  final List<bool> selectedProducts;

  final bool isAscending;

  final int? sortColumnIndex;

  final Failure? error;

  ProductsStateData(
      {required this.products,
      required this.selectedProducts,
      required this.isAscending,
      this.sortColumnIndex,
      this.error});

  factory ProductsStateData.empty() =>
      ProductsStateData(products: [], selectedProducts: [], isAscending: true);

  factory ProductsStateData.failure(Failure error) => ProductsStateData(
      products: [], selectedProducts: [], isAscending: true, error: error);
}
