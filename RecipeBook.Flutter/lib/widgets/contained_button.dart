import 'package:flutter/material.dart';
import 'package:recipebook/resources/palette.dart';

class ButtonContainedWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;

  const ButtonContainedWidget({
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
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Palette.orange,
          primary: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
