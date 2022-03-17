import 'package:flutter/material.dart';

const kTodosLocalDatabase = 'todos.db';

const int kPrimaryColorValue = 0xFF3DDC84;
const Map<int, Color> kPrimaryColorSwatches = {
  50: Color(0xFFE8FBF0),
  100: Color(0xFFC5F5DA),
  200: Color(0xFF9EEEC2),
  300: Color(0xFF77E7A9),
  400: Color(0xFF5AE196),
  500: Color(kPrimaryColorValue),
  600: Color(0xFF37D87C),
  700: Color(0xFF2FD371),
  800: Color(0xFF27CE67),
  900: Color(0xFF1AC554),
};
const MaterialColor kPrimaryColor =
    MaterialColor(kPrimaryColorValue, kPrimaryColorSwatches);

const int kPrimaryAccentColorValue = 0xFFC6FFD8;
const Map<int, Color> kPrimaryAccentColorSwatches = {
  100: Color(0xFFF9FFFB),
  200: Color(kPrimaryAccentColorValue),
  400: Color(0xFF93FFB4),
  700: Color(0xFF7AFFA3),
};
const MaterialColor kPrimaryAccentColor =
    MaterialColor(kPrimaryAccentColorValue, kPrimaryAccentColorSwatches);

const FloatingActionButtonThemeData kFloatingActionButtonTheme =
    FloatingActionButtonThemeData(
  backgroundColor: Colors.lightBlue,
  foregroundColor: Colors.white,
);

const TextStyle kWhiteText = TextStyle(color: Colors.white);
