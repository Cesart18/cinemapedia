import 'package:cinemapedia/presentation/widgets/side_menu/side_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(),

    // body

    body:  Placeholder(),

    // drawer

      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
