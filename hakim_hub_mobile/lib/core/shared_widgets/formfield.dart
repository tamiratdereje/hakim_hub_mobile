import 'dart:ffi';

import 'package:flutter/material.dart';

import '../utils/icons.dart';
import '../utils/ui_converter.dart';

class CSFFormField extends StatefulWidget {
  final String hintText;
  final Function onChanged;
  final bool obscureText;
  final TextEditingController controller;
  final Key? formkey;
  String? fieldName;
  bool? suffixIcon;

  CSFFormField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.obscureText,
    required this.controller,
    this.formkey,
    this.fieldName,
  }) : super(key: key);

  @override
  _CSFFormFieldState createState() => _CSFFormFieldState();
}

class _CSFFormFieldState extends State<CSFFormField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState state) {
        return TextField(
          obscureText: widget.obscureText,
          key: widget.formkey,
          controller: widget.controller,
          decoration: InputDecoration(
            
              constraints: BoxConstraints(
                
                  minHeight: UIConverter.getComponentHeight(context, 48),
                  minWidth: UIConverter.getComponentWidth(context, 370),
                  maxHeight: UIConverter.getComponentHeight(context, 48),
                  maxWidth: UIConverter.getComponentWidth(context, 370),
                   ),
              hintStyle: const TextStyle(color: Colors.black26),
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              errorText: errorText,
              prefixIcon: search,
              suffixIcon: const Icon(Icons.filter_list_outlined)
              ),
          onChanged: (value) {
            setState(() {
              errorText = null;
            });
            widget.onChanged(value);
          },
        );
      },
      validator: (value) {
        if (value == null) {
          setState(() {
            errorText = ' This ${widget.fieldName} field is required';
          });
          return '';
        }
        return null;
      },
    );
  }
}
