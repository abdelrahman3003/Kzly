import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class DropdownMenuModule extends StatelessWidget {
  final String? title;
  final String initialItem;
  final List<String> items;
  final Function(String?)? onChanged;

  const DropdownMenuModule(
      {super.key,
      required this.initialItem,
      required this.items,
      this.onChanged,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          title != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF675F6C),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ))
              : const SizedBox(height: 0),
          title != null ? const SizedBox(height: 8) : const SizedBox(height: 0),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: KzlyColors.primary, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            borderRadius: BorderRadius.circular(5),
            value: initialItem,
            isExpanded: true,
            icon: const Icon(SolarIconsOutline.altArrowDown),
            onChanged: onChanged,
            style: const TextStyle(
              color: Color(0xFF96919A),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
