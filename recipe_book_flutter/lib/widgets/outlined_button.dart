import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/theme.dart';

class ButtonOutlinedWidget extends StatelessWidget {
  const ButtonOutlinedWidget({
    required this.text,
    required this.width,
    required this.height,
    this.onPressed,
    this.icon,
    this.padding,
    this.color,
    super.key,
  });

  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;
  final IconData? icon;
  final double? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Palette.orange,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          side: BorderSide(
            color: text != '' ? Palette.orange : Palette.grey.withOpacity(0.7),
          ),
        ),
        onPressed: onPressed,
        child: icon == null
            ? Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .b18
                    .copyWith(color: Palette.orange),
              )
            : text != ''
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icon,
                        size: 24,
                        color: color ?? Palette.orange,
                      ),
                      SizedBox(width: padding),
                      Text(
                        text,
                        style: Theme.of(context)
                            .textTheme
                            .b18
                            .copyWith(color: Palette.orange),
                      ),
                    ],
                  )
                : Icon(
                    icon,
                    size: 24,
                    color: Palette.grey.withOpacity(0.7),
                  ),
      ),
    );
  }
}
