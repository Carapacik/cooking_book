import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/theme.dart';

class ButtonContainedWidget extends StatelessWidget {
  const ButtonContainedWidget({
    required this.text,
    required this.width,
    required this.height,
    this.onPressed,
    this.icon,
    this.padding,
    super.key,
  });

  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;
  final IconData? icon;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Palette.orange,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        onPressed: onPressed,
        child: icon == null
            ? Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .b18
                    .copyWith(color: Colors.white),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color: Colors.white,
                  ),
                  SizedBox(width: padding),
                  Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .b18
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
      ),
    );
  }
}
