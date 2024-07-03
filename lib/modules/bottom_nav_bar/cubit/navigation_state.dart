part of 'navigation_cubit.dart';

class NavigationState {
  final NavbarItem navbarItem;
  final int index;

  NavigationState(this.navbarItem, this.index);

  List<Object> get props => [navbarItem, index];
}
