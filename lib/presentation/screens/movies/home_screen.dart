import 'package:cinemapedia/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  final veiwRoutes = const <Widget>[
    HomeVeiw(),
    PopularView(),
    FavoritesView(),
    ConfigScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(),
      // body
      body: IndexedStack(
        index: pageIndex,
        children: veiwRoutes,
      ),

      // drawer
      // drawer: const SideMenu(),
      // bottom navigationbar
      bottomNavigationBar: CustomBottonNavigation(
        currentIndex: pageIndex,
      ),
    );
  }
}
