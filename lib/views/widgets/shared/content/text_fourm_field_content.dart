import 'package:flutter/material.dart';

class TextFourmFieldContent extends StatelessWidget {
  const TextFourmFieldContent({
    super.key,
    required this.text,
    required this.textFormField,
    this.verticalSpacing,
  });
  final Text text;
  final TextFormField textFormField;
  final double? verticalSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(alignment: Alignment.centerLeft, child: text),
        SizedBox(height: verticalSpacing ?? 4),
        textFormField,
      ],
    );
  }
}
