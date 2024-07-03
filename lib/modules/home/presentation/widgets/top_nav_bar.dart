import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/constants/constants.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgrounghilghtcolor,
          border: Border.all(
            color: themecolor,
          )),
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            color: titlecolor,
            onPressed: () => context.push('/profile'),
            icon: const Icon(Icons.person_rounded)),
        const SizedBox(width: 180),
        IconButton(
          color: titlecolor,
          onPressed: () => context.push('/cart'),
          // context.go('/course/sections/24'),
          icon: const Icon(Icons.shopping_cart),
        ),
        IconButton(
          color: titlecolor,
          onPressed: () => context.push('/search'),
          icon: const Icon(Icons.search),
        ),
      ]),
    );
  }
}
