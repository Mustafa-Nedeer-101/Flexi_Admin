import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/template/cubit/sidebar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSidebarMenu extends StatelessWidget {
  const CustomSidebarMenu(
      {super.key,
      required this.route,
      required this.icon,
      required this.itemName});

  final String route;
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final SidebarCubit cubit = context.read<SidebarCubit>();
    return InkWell(
      onTap: () => cubit.changeActiveRoute(route),
      onHover: (value) {
        value ? cubit.onHovered(route) : cubit.onHovered('');
      },
      child: BlocBuilder<SidebarCubit, SidebarState>(
        builder: (context, state) {
          switch (state) {
            case SidebarInitial():
              return const SizedBox();
            case SidebarActive():
              return Container(
                  decoration: BoxDecoration(
                      color: state.activeRoute == route ||
                              state.hoveredItem == route
                          ? CColors.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(CSizes.cardRadiusMd)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: CSizes.lg,
                              right: CSizes.md,
                              top: CSizes.md,
                              bottom: CSizes.md),
                          child: Icon(
                            icon,
                            size: 22,
                            color: state.activeRoute == route ||
                                    state.hoveredItem == route
                                ? CColors.white
                                : CColors.darkGrey,
                          )),
                      Flexible(
                        child: Text(itemName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: state.activeRoute == route ||
                                            state.hoveredItem == route
                                        ? CColors.white
                                        : CColors.darkGrey)),
                      )
                    ],
                  ));
          }
        },
      ),
    );
  }
}
