import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 1));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 1));
        break;
      case NavbarItem.assignment:
        emit(NavigationState(NavbarItem.assignment, 0));
        break;
      case NavbarItem.myCourse:
        emit(NavigationState(NavbarItem.myCourse, 2));
        break;
    }
  }
}
