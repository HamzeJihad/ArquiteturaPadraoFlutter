import 'package:flutter/material.dart';

const primaryColorDark = Color(0xff1a1a1a);
const cardDarkColor = Color(0xff1a1a1a);
const primaryColorLight = Color(0x0fff2021);
const blackColor = Color(0xff000000);
const scaffoldBackgroundColor = Color(0xff1a1a1a);
const primaryColor = Color(0xff0a69da);
const whiteColor = Colors.white;

class AppTheme {
  ThemeData getTheme(bool isDarkTheme) => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: isDarkTheme ? Brightness.light : Brightness.light,
      primary: primaryColor,
      onPrimary: whiteColor,
      secondary: whiteColor,
      onSecondary: whiteColor,
      error: Colors.red,
      onError: Colors.red,
      surface: Colors.grey,
      onSurface: whiteColor,
    ),

    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    cardColor: isDarkTheme ? whiteColor : blackColor,
    primaryTextTheme: Typography.whiteRedmond,
   cardTheme: CardThemeData(
      color: isDarkTheme ? cardDarkColor : whiteColor,
      surfaceTintColor: !isDarkTheme ? cardDarkColor : whiteColor,
    ),

    iconTheme: IconThemeData(
      color: isDarkTheme ? cardDarkColor : whiteColor,
      size: 30,
      opacity: 0.8,
    ),

    primaryIconTheme: const IconThemeData(color: whiteColor),


    scaffoldBackgroundColor:
        isDarkTheme ? scaffoldBackgroundColor : const Color(0xfff2f5f8),

    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(const TextStyle(color: whiteColor)),
        backgroundColor: const WidgetStatePropertyAll(primaryColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 55)),
        // backgroundColor: const MaterialStatePropertyAll(Colors.white),
      ),
    ),
    textButtonTheme: textButtonTheme(),

    radioTheme: const RadioThemeData(
      fillColor: WidgetStatePropertyAll(primaryColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(18),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColorLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey[400]!),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey[400]!),
      ),
      hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
      suffixIconColor: whiteColor,
    ),

    appBarTheme: const AppBarTheme(color: scaffoldBackgroundColor),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),

   dialogTheme: const DialogThemeData(
      surfaceTintColor: whiteColor,
      backgroundColor: whiteColor,
    ),
  );

  TextButtonThemeData textButtonTheme() {
    return const TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(TextStyle(color: whiteColor)),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    );
  }
}
