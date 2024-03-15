import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/getUser/get_user_bloc.dart';
import '../bloc/product/product_bloc.dart';
import '../bloc/target/target_bloc.dart';
import '../common/constant/utils.dart';
import 'home/home_screen.dart';
import 'profile/profile_screen.dart';
import 'targets/targets_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const TargetsScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<GetUserBloc>().add(const GetUserEvent.getProfile());
    log("Get User Api..");
    context.read<ProductBloc>().add(const ProductEvent.getProduct());
    log("Get Product Api..");
    context.read<TargetBloc>().add(const TargetEvent.getTarget());
    log("Get Targets Api..");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: KonekSeed.primaryColor,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: KonekSeed.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.insert_chart_outlined,
                color: KonekSeed.grey,
              ),
              label: 'Targets',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: KonekSeed.grey,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
