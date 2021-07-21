import 'package:flutter/material.dart';
import 'package:recipebook/resources/palette.dart';

class FormTextFieldWidget extends StatelessWidget {
  const FormTextFieldWidget({
    required this.height,
    required this.hintText,
    this.maxLength,
    this.minLines,
    this.textarea,
    Key? key,
  }) : super(key: key);

  final double height;
  final String hintText;
  final int? maxLength;
  final int? minLines;
  final bool? textarea;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        expands: textarea != null,
        maxLines: textarea != null ? null : 1,
        maxLength: maxLength,
        cursorColor: Palette.orange,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Palette.main),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 11, left: 24, right: 24),
          focusColor: Palette.orange,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.orange),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.grey.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Palette.main.withOpacity(0.5)),
        ),
      ),
    );
  }
}
