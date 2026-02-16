import 'package:flutter/material.dart';

class AppTheme {
  static const _primaryColor = Color(0xFF2E7D32); // Scout green
  static const _goldColor = Color(0xFFFFD600); // Crown gold
  static const _contestedColor = Color(0xFFD32F2F); // Contested red

  static const primaryColor = _primaryColor;
  static const goldColor = _goldColor;
  static const contestedColor = _contestedColor;

  static ThemeData get light => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _primaryColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      );

  static ThemeData get dark => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _primaryColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      );
}
