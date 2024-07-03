import 'package:flutter/material.dart';

import '/constants/color.dart';
import 'nav_bar_items.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.onTap, required this.currentIndex});

  final void Function(int)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1, //state.index,
      showUnselectedLabels: false,
      items: navBarItems,
      onTap: onTap,
      selectedItemColor: const Color.fromARGB(255, 253, 252, 255),
      unselectedItemColor: titlecolor,
      backgroundColor: boxcolor,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
