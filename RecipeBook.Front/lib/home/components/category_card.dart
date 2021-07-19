import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/palette.dart';

class CategoryCardWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final String? description;

  const CategoryCardWidget({
    required this.title,
    required this.iconPath,
    this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 271,
      width: 278,
      padding: const EdgeInsets.all(24),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Palette.iconBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              child: SvgPicture.asset(
                CookingIcons.menu,
                color: Palette.orange,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              color: Palette.main,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (description != null)
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Text(
                description!,
                style: const TextStyle(
                  color: Palette.mainLighten1,
                  fontSize: 18,
                ),
              ),
            )
          else
            const SizedBox(height: 12),
        ],
      ),
    );
  }
}
