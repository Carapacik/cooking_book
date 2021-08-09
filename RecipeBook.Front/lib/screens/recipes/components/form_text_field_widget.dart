import 'package:flutter/material.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';

class FormTextFieldWidget extends StatefulWidget {
  const FormTextFieldWidget({
    required this.hintText,
    this.height,
    this.width,
    this.controller,
    this.onSaved,
    this.maxLength,
    this.minLines,
    this.textarea,
    this.validator,
    this.keyboardType,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final double? height;
  final double? width;
  final String hintText;
  final int? maxLength;
  final int? minLines;
  final bool? textarea;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;

  @override
  _FormTextFieldWidgetState createState() => _FormTextFieldWidgetState();
}

class _FormTextFieldWidgetState extends State<FormTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width ?? double.infinity,
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        onSaved: widget.onSaved,
        textAlignVertical: TextAlignVertical.top,
        expands: widget.textarea != null,
        maxLines: widget.textarea != null ? null : 1,
        maxLength: widget.maxLength,
        cursorColor: Palette.orange,
        style: Theme.of(context).textTheme.r16.copyWith(color: Palette.main),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 11, left: 24, right: 24),
          focusColor: Palette.orange,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.red),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.orange),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.r16,
        ),
      ),
    );
  }
}
