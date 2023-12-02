import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottonNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottonNavigation({super.key, required this.currentIndex});

  void onItemTap(BuildContext context, int index) {
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      showUnselectedLabels: true,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.secondary,
      currentIndex: currentIndex,
      onTap: (value) => onItemTap(context, value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_sharp), label: 'Populares'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded), label: 'Favoritos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Configuracion'),
      ],
    );
  }
}
