import 'package:flutter/material.dart';
import 'package:recipebook/resources/palette.dart';

class ButtonOutlinedWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;

  const ButtonOutlinedWidget({
    Key? key,
    this.onPressed,
    required this.text,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          primary: Palette.orange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          side: const BorderSide(color: Palette.orange),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Palette.orange,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
