import 'package:flutter/material.dart';

final List<Color> colorsList = [
  Colors.deepPurpleAccent,
  Colors.deepOrangeAccent,
  Colors.green,
  Colors.blue
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false});

  ThemeData getTheme() => ThemeData(
      colorSchemeSeed: colorsList[selectedColor],
      brightness: isDarkMode ? Brightness.dark : Brightness.light);

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}
