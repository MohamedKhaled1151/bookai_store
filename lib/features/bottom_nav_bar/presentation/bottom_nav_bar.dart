import 'package:bookia/core/theming/app_colors.dart';
import 'package:bookia/features/cart/presentation/ui/cart_screen.dart';
import 'package:bookia/features/favorite/presentation/favorite_screen.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:bookia/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int activeCurrentIndex = 0;
  List<Widget> screen = [
    BlocProvider(
      create: (context) => HomeCubit()
        ..getSlider()
        ..getBestSeller(),

      child: HomeScreen(),
    ),
    ProfileScreen(),
    CartScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.mainColor,
        currentIndex: activeCurrentIndex,
        onTap: (index) {
          setState(() {
            activeCurrentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),

      body: screen[activeCurrentIndex],
    );
  }
}
