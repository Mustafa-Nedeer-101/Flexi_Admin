import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sidebar_state.dart';

class SidebarCubit extends Cubit<SidebarState> {
  SidebarCubit() : super(SidebarActive());

  changeActiveRoute(String route) {
    if (!isRouteActive(route)) emit(SidebarActive(activeRoute: route));
  }

  onHovered(String route) {
    emit(SidebarActive(
        hoveredItem: route, activeRoute: (state as SidebarActive).activeRoute));
  }

  bool isRouteActive(String route) {
    switch (state) {
      case SidebarInitial():
        return false;
      case SidebarActive():
        return (state as SidebarActive).activeRoute == route;
    }
  }

  bool isItemHovered(String route) {
    switch (state) {
      case SidebarInitial():
        return false;
      case SidebarActive():
        return (state as SidebarActive).hoveredItem == route;
    }
  }
}
