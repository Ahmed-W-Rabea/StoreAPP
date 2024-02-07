import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeTextfield extends StatelessWidget {
  CustomeTextfield(
      {this.hintText,
      this.obscureText = false,
      this.onChanged,
      this.inputType});
  String? hintText;
  TextInputType? inputType;

  Function(String)? onChanged;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
