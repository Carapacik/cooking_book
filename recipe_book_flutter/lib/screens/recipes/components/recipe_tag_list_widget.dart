import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/theme.dart';

class RecipeTagsList extends StatelessWidget {
  const RecipeTagsList({required this.tags, super.key});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 25,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tags.length > 3 ? 3 : tags.length,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Palette.orange.withOpacity(0.2),
                ),
                child: Text(
                  tags[index].toLowerCase(),
                  style: Theme.of(context)
                      .textTheme
                      .r14
                      .copyWith(color: Palette.orange),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 5);
            },
          ),
        ),
      ],
    );
  }
}
