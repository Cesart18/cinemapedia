import 'package:cinemapedia/domain/entities/menu_items/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

int navDrawerIndex = 0;

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final item = menuItems[value];
        context.go(item.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        ...menuItems.map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), label: Text(item.title)))
      ],
    );
  }
}
