import 'package:flutter/material.dart';

class ArticleInput extends StatefulWidget {
  final String hintText;
  final bool isMultiLine;
  const ArticleInput({
    super.key,
    this.hintText = '',
    this.isMultiLine = false,
  });

  @override
  State<ArticleInput> createState() => _ArticleInputState();
}

class _ArticleInputState extends State<ArticleInput> {
  @override
  Widget build(BuildContext context) {
    if (widget.isMultiLine) {
      return TextField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsetsDirectional.symmetric(
              horizontal: 8, vertical: 16),
        ),
        style: const TextStyle(
          height: 1.0,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        minLines: 5,
      );
    } else {
      return TextFormField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsetsDirectional.symmetric(
            horizontal: 8,
            vertical: 12,
          ),
          isDense: true,
        ),
        style: const TextStyle(
          height: 1.0,
        ),
      );
    }
  }
}
