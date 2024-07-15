
import 'package:flowers_store/views/widgets/shared/content/content_price.dart';
import 'package:flutter/material.dart';

class ContentPriceList extends StatelessWidget {
  const ContentPriceList(
      {super.key, required this.content, this.verticalSpacing});

  final List<Map<String, String>> content;
  final double? verticalSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: content.map((item) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ContentPrice(title: item.keys.first, value: item.values.first),
            SizedBox(
                height: verticalSpacing ?? 6), // Adjust the height as needed
          ],
        );
      }).toList(),
    );
  }
}
