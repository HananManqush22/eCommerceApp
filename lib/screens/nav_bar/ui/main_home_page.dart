import 'package:e_commerce_app/configuration/colors.dart';
import 'package:e_commerce_app/screens/favorite/ui/favorite_page.dart';
import 'package:e_commerce_app/screens/home/ui/home_page.dart';
import 'package:e_commerce_app/screens/nav_bar/logic/cubit/nav_bar_cubit.dart';
import 'package:e_commerce_app/screens/profile/ui/profile_page.dart';
import 'package:e_commerce_app/screens/store/ui/store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainHomePage extends StatelessWidget {
  MainHomePage({super.key});

  final List<Widget> view = [
    HomePage(),
    StorePage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          var cubit = NavBarCubit.get(context);
          return Scaffold(
            body: SafeArea(child: view[cubit.currentIndex]),

            bottomNavigationBar: Container(
              decoration: BoxDecoration(color: AppColors.kWhiteColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
                child: GNav(
                  selectedIndex: cubit.currentIndex,
                  onTabChange: (value) {
                    cubit.changeIndex(value);
                  },
                  rippleColor: AppColors
                      .kPrimaryColor, // tab button ripple color when pressed
                  hoverColor: AppColors.kPrimaryColor, // tab button hover color
                  haptic: true, // haptic feedback
                  tabBorderRadius: 15,

                  duration: Duration(
                    milliseconds: 400,
                  ), // tab animation duration
                  gap: 8, // the tab button gap between icon and text
                  color: AppColors.kGreyColor, // unselected icon color
                  activeColor:
                      AppColors.kWhiteColor, // selected icon and text color
                  iconSize: 24, // tab button icon size
                  tabBackgroundColor: AppColors.kPrimaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // navigation bar padding
                  tabs: [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(icon: Icons.store, text: 'Store'),
                    GButton(icon: Icons.favorite, text: 'Favorite'),
                    GButton(icon: Icons.person, text: 'Person'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
