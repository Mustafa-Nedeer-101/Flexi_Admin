part of 'sidebar_cubit.dart';

@immutable
sealed class SidebarState {
  final String activeRoute;
  final String hoveredItem;

  const SidebarState({required this.activeRoute, required this.hoveredItem});
}

final class SidebarActive extends SidebarState {
  const SidebarActive(
      {super.activeRoute = CSections.dashboard, super.hoveredItem = ""});
}
