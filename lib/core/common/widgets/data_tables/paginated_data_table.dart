import 'package:admin/core/common/loaders/animation_loader.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/images.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomPaginatedDataTable2 extends StatelessWidget {
  const CustomPaginatedDataTable2(
      {super.key,
      required this.columns,
      required this.source,
      this.sortAscending = true,
      this.sortColumnIndex,
      this.rowsPerPage = 10,
      this.onPageChanged,
      this.dataRowHeight = CSizes.xl * 2,
      this.tableHeight = 760,
      this.minWidth = 1000});

  final bool sortAscending;
  final int? sortColumnIndex;
  final int rowsPerPage;
  final DataTableSource source;
  final List<DataColumn> columns;
  final Function(int)? onPageChanged;
  final double dataRowHeight;
  final double tableHeight;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Theme(
        data: Theme.of(context).copyWith(
          cardTheme: const CardTheme(color: Colors.white, elevation: 0),
        ),
        child: PaginatedDataTable2(
          columnSpacing: 12,
          minWidth: minWidth,
          dividerThickness: 0,
          horizontalMargin: 12,
          dataRowHeight: dataRowHeight,
          rowsPerPage: rowsPerPage,

          // Header
          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor: WidgetStateProperty.resolveWith(
              (state) => CColors.primaryBackground),
          headingRowDecoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(CSizes.borderRadiusMd),
                  topRight: Radius.circular(CSizes.borderRadiusMd))),

          // Empty Animation
          empty: const CustomAnimationLoaderWidget(
            text: 'Nothing Found',
            animation: CImages.emptyList,
            height: 200,
            width: 200,
          ),

          // Checkbox column
          showCheckboxColumn: true,

          // Pagination
          showFirstLastButtons: true,
          onPageChanged: onPageChanged,
          renderEmptyRowsInTheEnd: false,
          onRowsPerPageChanged: (value) {},

          // Sorting
          sortAscending: sortAscending,
          sortArrowAlwaysVisible: true,
          sortColumnIndex: sortColumnIndex,
          sortArrowBuilder: (ascending, sorted) {
            if (sorted) {
              return Icon(
                ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down,
                size: CSizes.iconSm,
              );
            } else {
              return const Icon(
                Iconsax.arrow_3,
                size: CSizes.iconSm,
              );
            }
          },

          // Required
          columns: columns,
          source: source,
        ),
      ),
    );
  }
}
