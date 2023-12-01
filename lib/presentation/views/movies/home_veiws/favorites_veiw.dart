import 'package:flutter/material.dart';

class FavoritesVeiw extends StatelessWidget {
  const FavoritesVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favortes veiw'),
      ),
      body: const Center(
        child: Text('Favoritos'),
      ),
    );
  }
}
