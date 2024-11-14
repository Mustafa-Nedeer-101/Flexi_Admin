part of 'sidebar_cubit.dart';

@immutable
sealed class SidebarState {}

final class SidebarInitial extends SidebarState {}

final class SidebarActive extends SidebarState {
  final String activeRoute;
  final String hoveredItem;

  SidebarActive({this.activeRoute = 'Dashboard', this.hoveredItem = ''});
}
