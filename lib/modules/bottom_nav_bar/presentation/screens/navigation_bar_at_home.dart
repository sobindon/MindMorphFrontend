import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/nav_bar_items.dart';
import '../../cubit/navigation_cubit.dart';
import '../widgets/nav_bar.dart';

class NavigationBarAtHome extends StatelessWidget {
  const NavigationBarAtHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return BottomNavBar(
            currentIndex: state.index,
            onTap: (index) {
              if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.assignment);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.myCourse);
              }
            });
      },
    );
  }
}
