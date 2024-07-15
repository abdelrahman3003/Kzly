import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/widgets/shared/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditSection extends StatelessWidget {
  const EditSection({
    super.key,
    required this.tilte,
    this.hint,
    required this.icon,
    this.validator,
    this.keyboardType,
    this.controller,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
    this.obscureText = false,
    this.enable ,
  });
  final String tilte;
  final String? hint;
  final String icon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool? enable;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tilte != "Certificate"
            ? Text(
                tilte,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            : const SizedBox(),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 12),
          child: TextFormField(
            onTap: onTap,
            readOnly: readOnly,
            enabled: enable,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                hintText: hint,
                suffixIcon: suffixIcon,
                prefixIcon: AssetIcon(
                  assetPath: icon,
                  color: KzlyColors.secondryText,
                )),
            obscureText: obscureText,
            onSaved: (value) {},
            validator: validator,
          ),
        ),
      ],
    );
  }
}
