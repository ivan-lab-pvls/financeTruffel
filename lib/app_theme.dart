import 'package:flutter/material.dart';

class CustomTheme {
  static const Color blackFontColor = Color(0xFF171B34);
  static const Color justGrey = Color(0xFFbebebe);
  static const Color justGrey1 = Color(0xFFbdbdbd);
  static const Color justGrey2 = Color(0xFFA3A3A3);
  static const Color green = Color(0xFF00C664);
  static const Color primaryGrey = Color(0xFF202B31);
  static const Color secGrey = Color(0xFF3C3D42);

  static const Color grey = Color(0xFFF0F0F0);

  static ThemeData get darkTheme => ThemeData(
        primaryColor: green,
        scaffoldBackgroundColor: const Color(0xFF202B31),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF202B31),
          iconTheme: IconThemeData(color: Color(0xFF4F5055)),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Colors.white,
          ),
          titleLarge: TextStyle(
            fontSize: 11,
            color: justGrey1,
          ),
          titleMedium: TextStyle(
            fontSize: 10,
            color: justGrey1,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: TextStyle(
            color: justGrey1,
            fontSize: 11,
          ),
          labelMedium: TextStyle(
            fontSize: 10,
            color: justGrey2,
            height: 1.7,
          ),
          labelSmall: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      );
}
