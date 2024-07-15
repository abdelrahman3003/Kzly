import 'package:flutter/material.dart';

class AboutTextformfiled extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget? suffixIcon;
  final Function(String)? onsubmit;
  final String? Function(String?)? validator;
  const AboutTextformfiled({super.key, required this.hint, this.suffixIcon,this.controller, this.onsubmit, this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Color(0x99675F6C),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      onFieldSubmitted: onsubmit,
      validator: validator,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 100),
          child: suffixIcon,
        ),
        hintStyle: const TextStyle(
          color: Color(0x99675F6C),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFF96919A)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      minLines: 6, // any number you need (It works as the rows for the textarea)
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );
  }
}
