import 'package:cinemapedia/domain/entities/menu_items/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        final item = menuItems[value];
        value = selectedIndex;
        context.go(item.link);
      },
      children: [
        ...menuItems.map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), label: Text(item.title)))
      ],
    );
  }
}
