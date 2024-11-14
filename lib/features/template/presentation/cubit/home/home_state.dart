part of 'home_cubit.dart';

@immutable
sealed class HomeState {
  final HomeStateData data;

  const HomeState({required this.data});
}

final class HomeLoading extends HomeState {
  const HomeLoading({required super.data});
}

final class HomeSuccess extends HomeState {
  const HomeSuccess({required super.data});
}

final class HomeFailure extends HomeState {
  const HomeFailure({required super.data});
}

class HomeStateData {
  final List<ProductEntity> products;

  final List<bool> selectedProducts;

  final bool isAscending;

  final int? sortColumnIndex;

  final Failure? error;

  HomeStateData(
      {required this.products,
      required this.selectedProducts,
      required this.isAscending,
      this.sortColumnIndex,
      this.error});

  factory HomeStateData.empty() =>
      HomeStateData(products: [], selectedProducts: [], isAscending: true);

  factory HomeStateData.failure(Failure error) => HomeStateData(
      products: [], selectedProducts: [], isAscending: true, error: error);
}
