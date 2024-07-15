import 'package:flutter/material.dart';

@Deprecated("Use TextFormFiled instead with custom themes")
class KzlyTextField extends StatelessWidget {
  const KzlyTextField(
      {super.key,
      required this.label,
      required this.hintText,
      this.enablesvgSuffixIcon = false,
      this.hideLabel,
      this.keyboardType});
  final String label;
  final String hintText;
  final bool? enablesvgSuffixIcon;
  final bool? hideLabel;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        hideLabel == null || hideLabel == false
            ? Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              )
            : const SizedBox(height: 0),
        hideLabel == null || hideLabel == false
            ? const SizedBox(height: 4.0)
            : const SizedBox(height: 0),
        TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
              isDense: true,
              border: const OutlineInputBorder(),
              hintText: hintText,
              suffixIcon: enablesvgSuffixIcon!
                  ? IconButton(
                      onPressed: () {}, icon: const Icon(Icons.location_on))
                  : null),
        ),
      ],
    );
  }
}
