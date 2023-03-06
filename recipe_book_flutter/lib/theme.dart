import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book_flutter/resources/palette.dart';

final themeData = ThemeData.light().copyWith(
  primaryColor: Palette.orange,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: Palette.orange),
  primaryTextTheme: GoogleFonts.montserratTextTheme(),
  textTheme: _textTheme,
);

TextTheme get _textTheme => GoogleFonts.montserratTextTheme().copyWith();

extension TextThemeExt on TextTheme {
  TextStyle get b107 => displayMedium!.copyWith(
        color: Palette.orange,
        fontSize: 107,
        fontWeight: FontWeight.w600,
      );

  TextStyle get b72 => displayLarge!.copyWith(
        color: Palette.main,
        fontSize: 72,
        fontWeight: FontWeight.w700,
        height: 87 / 72,
      );

  TextStyle get b42 => displayMedium!.copyWith(
        color: Palette.main,
        fontSize: 42,
        fontWeight: FontWeight.w700,
        height: 62 / 42,
      );

  TextStyle get b24 => displaySmall!.copyWith(
        color: Palette.main,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );

  TextStyle get m24 => displaySmall!.copyWith(
        color: Palette.orange.withOpacity(0.5),
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  TextStyle get b20 => headlineMedium!.copyWith(
        color: Palette.mainLighten1,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 30 / 20,
      );

  TextStyle get b18 => bodyLarge!.copyWith(
        color: Palette.main,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  TextStyle get r18 => bodyLarge!.copyWith(
        color: Palette.mainLighten1,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );

  TextStyle get r16 => bodyMedium!.copyWith(
        color: Palette.main.withOpacity(0.5),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get r14 => bodyMedium!.copyWith(
        color: Palette.main.withOpacity(0.5),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  TextStyle get n18 => bodyMedium!.copyWith(
        color: Palette.orange,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );
}
