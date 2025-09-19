import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
  useMaterial3: true,

  // Color Scheme
  colorScheme: ColorScheme.fromSeed(
      seedColor: CustomColors.mainColor
  )
  );
}

class CustomColors {
  static const Color mainColor = Color(0xff003366);
  static const Color primaryBlue = Color(0xff003366);
  static const Color secondary = Color(0xff2EC5EF);
  static const Color primaryText = Color(0xff1A2128);
  static const Color secondaryText = Color(0xff434D56);
  static const Color tertiaryText = Color(0xffA9B2B9);
  static const Color blue10 = Color(0xffccd6e0);
  static const Color blue20 = Color(0xffb2c1d1);
  static const Color blue30 = Color(0xff99adc1);
  static const Color blue40 = Color(0xff7f99b2);
  static const Color blue50 = Color(0xff6684a3);
  static const Color blue60 = Color(0xff4c7093);
}


