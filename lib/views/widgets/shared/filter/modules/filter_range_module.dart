import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';

class FilterRangeModule extends StatelessWidget {
  final String? title;
  final String? trailing;
  final RangeValues? range;
  final RangeValues value;
  final Function(RangeValues)? onChanged;

  const FilterRangeModule(
      {super.key,
      this.title,
      this.range,
      required this.value,
      this.onChanged,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title != null || trailing != null
            ? Padding(
                padding: const EdgeInsets.only(left: 7, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    title != null
                        ? Text(
                            title!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF675F6C),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : const SizedBox.shrink(),
                    trailing != null
                        ? Text(
                            trailing!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF675F6C),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              )
            : const SizedBox(height: 0),
        RangeSlider(
          values: value,
          min: range?.start ?? 0,
          max: range?.end ?? 100,
          activeColor: KzlyColors.primary,
          onChanged: onChanged,
          labels: RangeLabels(
            value.start.round().toString(),
            value.end.round().toString(),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'EGP ${value.start.round()}',
                style: const TextStyle(
                  color: Color(0xFF675F6C),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'EGP ${value.end.round()}',
                style: const TextStyle(
                  color: Color(0xFF675F6C),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
