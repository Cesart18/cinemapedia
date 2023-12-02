import 'package:cinemapedia/config/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigScreen extends ConsumerWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDardMode = ref.watch(themeNotifierProvider).isDarkMode;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Configuracion'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              },
              icon: Icon(isDardMode
                  ? Icons.dark_mode_rounded
                  : Icons.light_mode_rounded))
        ],
      ),
      body: const _ConfigVeiw(),
    );
  }
}

class _ConfigVeiw extends ConsumerWidget {
  const _ConfigVeiw();

  @override
  Widget build(BuildContext context, ref) {
    final colorList = ref.watch(colorListProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    return SafeArea(
        child: Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: colorList.length,
          itemBuilder: (context, index) {
            final color = colorList[index];
            return RadioListTile(
              activeColor: color,
              title: Text(
                'Este Color',
                style: TextStyle(color: color),
              ),
              value: index,
              groupValue: selectedColor,
              onChanged: (value) {
                ref
                    .read(themeNotifierProvider.notifier)
                    .changeColorIndex(index);
              },
            );
          },
        )),
        FilledButton(onPressed: () {}, child: const Text('Prueba de color'))
      ],
    ));
  }
}
