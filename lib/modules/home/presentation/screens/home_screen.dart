import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/modules/bottom_nav_bar/bottom_nav_bar.dart';
import '/modules/screens/Enrolledcourse/enrollcourse.dart';
import '/modules/screens/assignment/list.dart';
import 'home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationCubit()),
        // TODO: Providers for hero section
      ],
      child: Scaffold(
        bottomNavigationBar: const NavigationBarAtHome(),
        body: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
          if (state.navbarItem == NavbarItem.assignment) {
            return AssignmentList();
          } else if (state.navbarItem == NavbarItem.myCourse) {
            return EnrolledCourse();
          }
          return const HomePage();
        }),
      ),
    );
  }
}
