import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class DateSelectorModule extends StatelessWidget {
  final String? title;
  final Function(DateTime?) onChanged;

  const DateSelectorModule({super.key, required this.onChanged, this.title});

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
          TextFormField(
            readOnly: true,
            onTap: () {
              showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2025),
              ).then((value) => onChanged(value));
            },
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Select Date',
              hintStyle: const TextStyle(
                color: Color(0xFF96919A),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: const Icon(
                SolarIconsOutline.calendar,
                color: Color(0xFF96919A),
              ),
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: KzlyColors.primary,
                  width: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
