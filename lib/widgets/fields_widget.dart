// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TxtField extends StatelessWidget {
  final controller;
  final validator;
  final onChanged;
  final hintText;
  final prefixIcon;
  final keyboardType;
  final obscureText;
  final suffixWidget;
  final isPhone;
  final colorPrefixIcon;
  final isReadOnly;
  final onTap;
  final formatRegx;
  final maxLines;
  final focusNode;
  const TxtField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.onChanged,
      required this.hintText,
      required this.prefixIcon,
      required this.keyboardType,
      this.obscureText = false,
      this.suffixWidget,
      this.isPhone = false,
      this.colorPrefixIcon = Colors.white,
      this.isReadOnly = false,
      this.onTap,
      this.formatRegx,
      this.focusNode,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // inputFormatters: <TextInputFormatter>[
      //   FilteringTextInputFormatter.allow(RegExp(!isPhone?"[0-9a-zA-Z]":'[0-9]')),
      // ],
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      readOnly: isReadOnly,
      textInputAction: TextInputAction.done,
      onTap: onTap,
      focusNode: focusNode,
      style: TextStyle(fontSize: 18.0, color: Colors.white),
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      maxLength: 50,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: "",
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
          // height: maxLines == 1 ? 0 : 3.8,
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.2),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: colorPrefixIcon ?? Colors.white,
        ),
        suffixIcon: suffixWidget,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
      inputFormatters: [
        if (isPhone == true)
          FilteringTextInputFormatter.digitsOnly
        else if (formatRegx != null)
          FilteringTextInputFormatter.allow(formatRegx)
      ],
    );
  }
}
