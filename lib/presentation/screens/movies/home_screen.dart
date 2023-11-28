import 'package:cinemapedia/presentation/widgets/side_menu/side_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,

    // body

    body: const Center(
      child: Text('Home Screen'),
    ),

    // drawer

      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
