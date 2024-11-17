import 'package:admin/core/common/widgets/data_tables/paginated_data_table.dart';
import 'package:admin/features/products/domain/entities/product_entity.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/products/presentation/cubit/products_cubit.dart';
import 'package:iconsax/iconsax.dart';

class ProductsDesktopLayout extends StatelessWidget {
  const ProductsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductsCubit>().fetchProducts();

    return Padding(
      padding: const EdgeInsets.all(CSizes.md),
      child: Center(
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            switch (state) {
              case ProductsLoading():
                return const CircularProgressIndicator();
              case ProductsSuccess():
                return ProductsTable(state: state);
              case ProductsFailure():
                return Text(state.data.error!.message);
            }
          },
        ),
      ),
    );
  }
}

class ProductsTable extends StatelessWidget {
  const ProductsTable({super.key, required this.state});

  final ProductsSuccess state;

  @override
  Widget build(BuildContext context) {
    // Read Cubit
    return ListView(
      children: [
        // Search
        TextFormField(
            controller: context.read<ProductsCubit>().searchController,
            onChanged: (query) =>
                context.read<ProductsCubit>().searchQuery(query),
            decoration: const InputDecoration(
                hintText: 'Search in products...',
                prefixIcon: Icon(Iconsax.search_normal))),

        const SizedBox(height: CSizes.spaceBtwSections),

        // paginated Table
        CustomPaginatedDataTable2(
          sortAscending: state.data.isAscending, // Dynamic
          sortColumnIndex: state.data.sortColumnIndex, // Dynamic

          columns: [
            DataColumn(
              label: const Text('Name'),
              onSort: (columnIndex, ascending) {
                context.read<ProductsCubit>().sort((ProductEntity product) {
                  return product.description ?? '';
                }, columnIndex, ascending);
              },
            ),
            DataColumn(
              label: const Text('Sale'),
              onSort: (columnIndex, ascending) {
                context.read<ProductsCubit>().sort((ProductEntity product) {
                  return product.salePrice;
                }, columnIndex, ascending);
              },
            ),
            DataColumn(
              label: const Text('Brand'),
              onSort: (columnIndex, ascending) {
                context.read<ProductsCubit>().sort((ProductEntity product) {
                  return product.brand?.name ?? '';
                }, columnIndex, ascending);
              },
            ),
          ],
          source: MyData(context: context, state: state),
        ),
      ],
    );
  }
}

// Source
class MyData extends DataTableSource {
  final ProductsSuccess state;
  final BuildContext context;

  MyData({
    required this.state,
    required this.context,
  });

  @override
  DataRow getRow(int index) {
    final product = state.data.products[index];

    return DataRow2(
      onTap: () {},
      selected: state.data.selectedProducts[index],
      onSelectChanged: (selected) {
        context.read<ProductsCubit>().toggleSelection(index);
      },
      cells: [
        DataCell(Text(product.title)),
        DataCell(Text(product.salePrice.toString())),
        DataCell(Text(product.brand?.name ?? '')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => state.data.products.length;

  @override
  int get selectedRowCount =>
      state.data.selectedProducts.where((isSelected) => isSelected).length;
}
