import 'package:admin/core/common/widgets/data_tables/paginated_data_table.dart';
import 'package:admin/features/template/domain/entities/product_entity.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/template/presentation/cubit/home/home_cubit.dart';
import 'package:admin/features/template/presentation/layouts/header/header_layout.dart';
import 'package:admin/features/template/presentation/layouts/sidebar/sidebar_layout.dart';
import 'package:iconsax/iconsax.dart';

class CustomDesktopLayout extends StatelessWidget {
  const CustomDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().fetchProducts();

    return Scaffold(
      body: Row(
        children: [
          // Drawer
          const Expanded(child: CustomSidebarLayout()),

          Expanded(
            flex: 5,
            child: Column(
              children: [
                // TopBar
                const CustomHeaderLayout(),

                // Body
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(CSizes.md),
                    child: Center(
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          switch (state) {
                            case HomeLoading():
                              return const CircularProgressIndicator();
                            case HomeSuccess():
                              return ProductsTable(state: state);
                            case HomeFailure():
                              return Text(state.data.error!.message);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductsTable extends StatelessWidget {
  const ProductsTable({super.key, required this.state});

  final HomeSuccess state;

  @override
  Widget build(BuildContext context) {
    // Read Cubit
    return ListView(
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        TextFormField(
          controller: context.read<HomeCubit>().searchController,
          onChanged: (query) {
            context.read<HomeCubit>().searchQuery(query);
          },
          decoration: const InputDecoration(
              hintText: 'Search in products...',
              prefixIcon: Icon(Iconsax.search_normal)),
        ),
        const SizedBox(height: CSizes.spaceBtwSections),
        CustomPaginatedDataTable2(
          sortAscending: state.data.isAscending, // Dynamic
          sortColumnIndex: state.data.sortColumnIndex, // Dynamic

          columns: [
            DataColumn(
              label: const Text('Name'),
              onSort: (columnIndex, ascending) {
                context.read<HomeCubit>().sort((ProductEntity product) {
                  return product.description ?? '';
                }, columnIndex, ascending);
              },
            ),
            DataColumn(
              label: const Text('Sale'),
              onSort: (columnIndex, ascending) {
                context.read<HomeCubit>().sort((ProductEntity product) {
                  return product.salePrice;
                }, columnIndex, ascending);
              },
            ),
            DataColumn(
              label: const Text('Brand'),
              onSort: (columnIndex, ascending) {
                context.read<HomeCubit>().sort((ProductEntity product) {
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

class MyData extends DataTableSource {
  final HomeSuccess state;
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
        context.read<HomeCubit>().toggleSelection(index);
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
