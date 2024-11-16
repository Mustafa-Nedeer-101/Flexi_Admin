import 'package:admin/core/constants/sections.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'sidebar_state.dart';

class SidebarCubit extends Cubit<SidebarState> {
  SidebarCubit() : super(const SidebarActive());

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  changeActiveRoute(String route) {
    if (!isRouteActive(route)) emit(SidebarActive(activeRoute: route));
  }

  onHovered(String route) {
    emit(SidebarActive(
        hoveredItem: route, activeRoute: (state as SidebarActive).activeRoute));
  }

  bool isRouteActive(String route) {
    return state.activeRoute == route;
  }

  bool isItemHovered(String route) {
    return state.hoveredItem == route;
  }
}
