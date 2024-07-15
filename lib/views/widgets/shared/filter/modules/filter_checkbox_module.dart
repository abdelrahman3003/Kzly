import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';

class FilterCheckboxModule extends StatelessWidget {
  const FilterCheckboxModule(
      {super.key, required this.options, this.title, this.onChanged});
  final Map<String, bool>? options;
  final String? title;
  final Function(Map<String, bool>? options)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        title != null
            ? Padding(
                padding: const EdgeInsets.only(left: 7, bottom: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF675F6C),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              )
            : const SizedBox(height: 0),
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            children: options != null
                ? options!.entries.map<Widget>((MapEntry<String, bool> option) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: () => onChanged!({
                        ...options!,
                        option.key: !option.value,
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.scale(
                              scale: 1.28,
                              child: Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: option.value,
                                onChanged: (value) {
                                  if (onChanged != null) {
                                    onChanged!({
                                      ...options!,
                                      option.key: value!,
                                    });
                                  }
                                },
                                fillColor: WidgetStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return KzlyColors.primary;
                                  }
                                  return KzlyColors.secondry;
                                }),
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                            const SizedBox(width: 3),
                            Text(option.key),
                          ],
                        ),
                      ),
                    );
                  }).toList()
                : const <Widget>[],
          ),
        ),
      ],
    );
  }
}
