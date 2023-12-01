import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final IconData icon;
  final String link;

  MenuItem(
      {required this.title,
      required this.subTitle,
      required this.icon,
      required this.link});
}

final List<MenuItem> menuItems = [
  MenuItem(
      title: 'Home',
      subTitle: 'Home Screen',
      icon: Icons.home,
      link: '/home/0'),
  MenuItem(
      title: 'Configuracion',
      subTitle: 'Configuracion del usuario',
      icon: Icons.settings,
      link: '/config')
];
