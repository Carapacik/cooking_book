import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_book_flutter/resources/icons.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/theme.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({required this.value, required this.text, super.key});

  final int value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      padding: const EdgeInsets.only(left: 22, top: 21, right: 29, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Palette.shadowColor,
            offset: Offset(0, 16),
            blurRadius: 72,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Palette.uploadPhotoBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  CookingIcons.menu,
                  width: 20,
                  colorFilter:
                      const ColorFilter.mode(Palette.orange, BlendMode.srcIn),
                ),
              ),
              const SizedBox(height: 13),
              Text(
                text,
                style: Theme.of(context).textTheme.b18,
              ),
            ],
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.b107,
          ),
        ],
      ),
    );
  }
}
