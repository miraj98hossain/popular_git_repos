import 'package:flutter/material.dart';
import 'package:popular_git_repos/core/theme/app_theme.dart';

class TextThemes {
  static TextTheme lightTextTheme() => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.secondary,
          fontSize: 22,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.secondary,
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        bodySmall: TextStyle(
          color: appTheme.secondary,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: appTheme.secondary,
          fontSize: 25,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.secondary,
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.secondary,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      );
  static TextTheme darkTextTheme() => const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      );
}
