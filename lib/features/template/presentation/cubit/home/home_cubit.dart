import 'package:admin/core/service_locator/get_it.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/template/data/repositories/products_repo.dart';
import 'package:admin/features/template/domain/entities/product_entity.dart';
import 'package:admin/features/template/domain/usecases/fetch_products_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading(data: HomeStateData.empty()));

  final List<ProductEntity> allProducts = [];
  final List<ProductEntity> filteredProducts = [];
  final TextEditingController searchController = TextEditingController();

  // Fetch products from Backend
  fetchProducts() async {
    emit(HomeLoading(data: HomeStateData.empty()));

    final result =
        await FetchProductsUsecase(repo: getIt<ProductsRepoImp>()).call();

    result.fold((failure) {
      emit(HomeFailure(data: HomeStateData.failure(failure)));
    }, (products) {
      allProducts.addAll(products);

      final List<bool> selectedProducts =
          List<bool>.filled(products.length, false);

      emit(HomeSuccess(
          data: HomeStateData(
              products: products,
              selectedProducts: selectedProducts,
              isAscending: true)));
    });
  }

  // Sort the products from the previous state
  void sort<T>(Comparable<T> Function(ProductEntity product) getField,
      int columnIndex, bool ascending) {
    // Handle
    final List<bool> selectedProducts =
        List<bool>.filled(state.data.products.length, false);
    List<ProductEntity> products = state.data.products;

    // Sort
    products.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    // Emit
    emit(HomeSuccess(
        data: HomeStateData(
            products: products,
            selectedProducts: selectedProducts,
            isAscending: ascending,
            sortColumnIndex: columnIndex)));
  }

  // Select a specific product from the previous states
  void toggleSelection(int index) {
    // Handle
    final List<bool> selectedProducts =
        List<bool>.from(state.data.selectedProducts);
    List<ProductEntity> products = state.data.products;

    if (selectedProducts.length > index) {
      selectedProducts[index] = !selectedProducts[index];
    }

    emit(HomeSuccess(
        data: HomeStateData(
            products: products,
            selectedProducts: selectedProducts,
            isAscending: state.data.isAscending,
            sortColumnIndex: state.data.sortColumnIndex)));
  }

  // Filter products and emit new filtered products
  void searchQuery(String query) {
    query = query.toLowerCase();

    // Empty and then Filter
    filteredProducts.clear();

    filteredProducts.addAll(allProducts.where((p) =>
        p.title.toLowerCase().contains(query) ||
        (p.description?.toLowerCase() ?? '').contains(query)));

    final List<bool> selectedProducts =
        List<bool>.filled(filteredProducts.length, false);

    // Emit
    emit(HomeSuccess(
      data: HomeStateData(
        products: filteredProducts,
        selectedProducts: selectedProducts,
        isAscending: true,
      ),
    ));
  }
}
