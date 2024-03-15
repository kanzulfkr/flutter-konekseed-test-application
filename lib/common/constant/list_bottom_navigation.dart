import 'package:flutter/material.dart';

import 'konekseed_color.dart';

class ListBottomNavigation {
  List<Widget> get defaultBottomNavigasi {
    return const <Widget>[
      NavigationDestination(
        selectedIcon: Icon(
          Icons.home_filled,
          color: KonekSeed.primaryColor,
        ),
        icon: Icon(
          Icons.home_filled,
          color: KonekSeed.grey,
        ),
        label: 'Home',
      ),
      NavigationDestination(
        selectedIcon: Icon(
          Icons.insert_chart_outlined,
          color: KonekSeed.primaryColor,
        ),
        icon: Icon(
          Icons.insert_chart_outlined,
          color: KonekSeed.grey,
        ),
        label: 'Targets',
      ),
      NavigationDestination(
        selectedIcon: Icon(
          Icons.person,
          color: KonekSeed.primaryColor,
        ),
        icon: Icon(
          Icons.person,
          color: KonekSeed.grey,
        ),
        label: 'Profile',
      ),
    ];
  }
}
