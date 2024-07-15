import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';

class FilterRadioButtonModule extends StatelessWidget {
  const FilterRadioButtonModule(
      {super.key,
      required this.options,
      this.title,
      required this.onSelected,
      required this.selectedRating});
  final List<String>? options;
  final String? title;
  final int selectedRating;
  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
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
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 12,
              children: options != null
                  ? options!.map((option) {
                      int index = options!.indexOf(option);
                      return ChoiceChip(
                          showCheckmark: false,
                          label: Text(option),
                          selected: selectedRating == index,
                          color: MaterialStateColor.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return KzlyColors.primary;
                            }
                            return KzlyColors.secondry;
                          }),
                          side: BorderSide.none,
                          labelStyle: TextStyle(
                            color: selectedRating == index
                                ? KzlyColors.white
                                : KzlyColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          onSelected: (value) => onSelected(index));
                    }).toList()
                  : const <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
