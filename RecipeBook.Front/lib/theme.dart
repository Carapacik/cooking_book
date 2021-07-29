import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipebook/resources/palette.dart';

final themeData = ThemeData.light().copyWith(
  primaryColor: Palette.orange,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: Palette.orange),
  primaryTextTheme: GoogleFonts.montserratTextTheme(),
  textTheme: _textTheme,
);

TextTheme get _textTheme => GoogleFonts.montserratTextTheme().copyWith();

extension TextThemeExt on TextTheme {
  TextStyle get b72 => headline1!.copyWith(
        color: Palette.main,
        fontSize: 72,
        fontWeight: FontWeight.w700,
      );

  TextStyle get b42 => headline2!.copyWith(
        color: Palette.main,
        fontSize: 42,
        fontWeight: FontWeight.w700,
        height: 62 / 42,
      );

  TextStyle get b24 => headline3!.copyWith(
        color: Palette.main,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );

  TextStyle get b20 => headline4!.copyWith(
        color: Palette.mainLighten1,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 30 / 20,
      );

  TextStyle get r18 => bodyText1!.copyWith(
        color: Palette.mainLighten1,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );

  TextStyle get r16 => bodyText2!.copyWith(
        color: Palette.main.withOpacity(0.5),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get r14 => bodyText2!.copyWith(
    color: Palette.main.withOpacity(0.5),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  TextStyle get n18 => bodyText2!.copyWith(
        color: Palette.orange,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );
}
