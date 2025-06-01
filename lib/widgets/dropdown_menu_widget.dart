// ignore_for_file: deprecated_member_use

import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatelessWidget {
  final String? selectedValue;
  final String hint;
  final validator;
  final List<String> items;
  final bool isMatchSchdual;
  final void Function(String?)? onChanged;

  const DropDownMenuWidget(
      {super.key,
      required this.selectedValue,
      required this.hint,
      required this.items,
      required this.onChanged,
      this.isMatchSchdual = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<String>(
        validator: validator,
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              hintText: hint,
              counterText: "",
              hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
              filled: true,
              fillColor: isMatchSchdual
                  ? Colors.grey.withOpacity(0.2)
                  : lightBlackColor,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
            isEmpty: selectedValue == null,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                isDense: true,
                onChanged: onChanged,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: primaryColor,
                  size: 30,
                ),
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
