import 'package:flutter/material.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';

void errorSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    content: Text(
      text,
      style: Theme.of(context).textTheme.b18.copyWith(color: Palette.red),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
