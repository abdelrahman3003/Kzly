import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flutter/material.dart';

class BasicDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isLoading;
  final VoidCallback onNo;
  final VoidCallback onYes;

  const BasicDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onNo,
    required this.onYes,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: KzlyColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextThemes.label.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              subtitle,
              style: TextThemes.subtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: onNo,
                    style: const ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(Size.fromHeight(42.0)),
                        backgroundColor: WidgetStatePropertyAll(KzlyColors.primary),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))))),
                    child: const Text(
                      "No",
                      style: TextStyle(
                          fontSize: 14,
                          color: KzlyColors.primaryWhiteText,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: onYes,
                    style: const ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(Size.fromHeight(42.0)),
                        backgroundColor: WidgetStatePropertyAll(KzlyColors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            side: BorderSide(color: KzlyColors.primary, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5))))),
                    child: isLoading
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: KzlyColors.primary,
                              ),
                            ),
                          )
                        : const Text(
                            "Yes",
                            style: TextStyle(
                                fontSize: 14,
                                color: KzlyColors.primary,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
