import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';

class CategoryCardWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final String? description;
  final String? searchQuery;
  final VoidCallback? onPressed;

  const CategoryCardWidget({
    required this.title,
    required this.iconPath,
    this.description,
    this.searchQuery,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 278,
      height: description != null ? 270 : 165,
      clipBehavior: Clip.antiAlias,
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
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          primary: Palette.orange,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: 250,
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
                      iconPath,
                      color: Palette.orange,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  title,
                  style: Theme.of(context).textTheme.b24,
                ),
                if (description != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      description!,
                      style: Theme.of(context).textTheme.r18,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
