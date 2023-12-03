import 'package:cinemapedia/config/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigScreen extends ConsumerWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDardMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
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
    final isDardMode = ref.watch(themeNotifierProvider).isDarkMode;
    final colors = Theme.of(context).colorScheme;

    final nameOfColor = <String>[
      'Morado',
      'Naranja',
      'Verde',
      'Azul',
      'Amarillo',
      'Rojo',
      'Blanco'
    ];
    return SafeArea(
        child: Column(
      children: [
        ExpansionTile(
            title: Text(
              'Colores',
              style: TextStyle(color: colors.primary),
            ),
            initiallyExpanded: true,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: colorList.length,
                itemBuilder: (context, index) {
                  final color = colorList[index];
                  return RadioListTile(
                    activeColor: (color == Colors.white && !isDardMode)
                        ? Colors.black
                        : color,
                    title: Text(
                      nameOfColor[index],
                      style: TextStyle(
                        color: (color == Colors.white && !isDardMode)
                            ? Colors.black
                            : color,
                      ),
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
              ),
            ]),
        FilledButton(onPressed: () {}, child: const Text('Prueba de color'))
      ],
    ));
  }
}
