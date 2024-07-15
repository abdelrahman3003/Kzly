import 'package:flutter/material.dart';

class AppDropDownButton extends StatefulWidget {
  final String title;
  const AppDropDownButton({Key? key, required this.title}) : super(key: key);

  @override
  _DropDownThreeState createState() => _DropDownThreeState();
}

class _DropDownThreeState extends State<AppDropDownButton> {
  String dropdownvalue = "";
  var items = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'watermelon',
    'Pineapple'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(15)),
            child: DropdownButton(
              // value: dropdownvalue,
              value: dropdownvalue.isNotEmpty
                  ? dropdownvalue
                  : null, // guard it with null if empty
              hint: Text('Your Fruit'),
              isExpanded: true,
              underline: SizedBox(),
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 30,
              items: items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  dropdownvalue = newValue.toString();
                });
              },
            ),
          );
  }
}