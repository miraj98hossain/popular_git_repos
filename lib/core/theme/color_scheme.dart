import 'package:flutter/material.dart';

class ColorSchemes {
  static const colorSchemeLight = ColorScheme.light(
    brightness: Brightness.light,
    surface: Color.fromRGBO(0, 123, 159, 1),
    primary: Color.fromRGBO(51, 92, 179, 1),
    onPrimary: Colors.white,
    onPrimaryContainer: Colors.white,
    secondary: Color.fromRGBO(97, 167, 216, 1),
    tertiary: Color.fromRGBO(59, 57, 99, 1),
    error: Color.fromRGBO(255, 56, 56, 1),
  );
  static const colorSchemeDark = ColorScheme.light(
    brightness: Brightness.dark,
    surface: Color.fromRGBO(0, 123, 159, 1),
    primary: Color.fromRGBO(51, 92, 179, 1),
    secondary: Color.fromRGBO(97, 167, 216, 1),
    tertiary: Color.fromRGBO(59, 57, 99, 1),
    error: Color.fromRGBO(255, 56, 56, 1),
  );
}
