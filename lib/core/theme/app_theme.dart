import 'package:flutter/material.dart';
import 'package:popular_git_repos/core/theme/color_scheme.dart';
import 'package:popular_git_repos/core/theme/primary_colors.dart';
import 'package:popular_git_repos/core/theme/text_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: lightTextTheme,
    primaryColor: ColorSchemes.colorSchemeLight.surface,
    scaffoldBackgroundColor: ColorSchemes.colorSchemeLight.surface,
    brightness: Brightness.light,
    colorScheme: ColorSchemes.colorSchemeLight,
    switchTheme: const SwitchThemeData(
      trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
    ),
    expansionTileTheme: const ExpansionTileThemeData(shape: Border()),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorSchemes.colorSchemeLight.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        overlayColor: Colors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: lightTextTheme.bodyMedium!.copyWith(color: Colors.grey),
      filled: true,
      fillColor: appTheme.white,
      // contentPadding: const EdgeInsets.symmetric(
      //   horizontal: 10,
      //   vertical: 10,
      // ),
      labelStyle: lightTextTheme.bodyMedium!.copyWith(color: appTheme.primary),
      floatingLabelStyle:
          lightTextTheme.bodyMedium!.copyWith(color: Colors.black),

      // When input field is not focused and not showing errors
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: appTheme.primary, // Default border color
        ),
        borderRadius: BorderRadius.circular(8),
      ),

      // When input field is focused
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: appTheme.primary, // Highlight color when focused
        ),
        borderRadius: BorderRadius.circular(8),
      ),

      // When input field is enabled but not focused
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: appTheme.primary.withOpacity(
              0.7), // Slightly lighter when enabled but not focused
        ),
        borderRadius: BorderRadius.circular(8),
      ),

      // When input field has an error
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.red, // Border color when there's an error
        ),
        borderRadius: BorderRadius.circular(8),
      ),

      // When the input field is focused and has an error
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.red, // Same as error color but for focused state
        ),
        borderRadius: BorderRadius.circular(8),
      ),

      // When input field is disabled
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.grey, // Border color when the field is disabled
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
  // static final ThemeData darkTheme = ThemeData(
  //   useMaterial3: true,
  //   textTheme: darkTextTheme,
  //   primaryColor: ColorSchemes.colorSchemeDark.surface,
  //   scaffoldBackgroundColor: ColorSchemes.colorSchemeDark.surface,
  //   brightness: Brightness.dark,
  //   colorScheme: ColorSchemes.colorSchemeDark,
  //   switchTheme: const SwitchThemeData(
  //     trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: ColorSchemes.colorSchemeDark.surface,
  //       overlayColor: Colors.black,
  //     ),
  //   ),
  // );
}

PrimaryColors get appTheme => PrimaryColors();
TextTheme get lightTextTheme => TextThemes.lightTextTheme();
TextTheme get darkTextTheme => TextThemes.darkTextTheme();
