import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/ui_converter.dart';
import 'filter_page.dart';

class HospitalSearchField extends StatefulWidget {
  final String hintText;
  final Function onChanged;
  final bool obscureText;
  final TextEditingController controller;
  final Key? formkey;
  String? fieldName;

  HospitalSearchField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.obscureText,
    required this.controller,
    this.formkey,
    this.fieldName,
  }) : super(key: key);

  @override
  _HospitalSearchFieldState createState() => _HospitalSearchFieldState();
}

class _HospitalSearchFieldState extends State<HospitalSearchField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState state) {
        return TextFormField(
          obscureText: false,
          controller: widget.controller,
          decoration: InputDecoration(
              constraints: BoxConstraints(
                minHeight: UIConverter.getComponentHeight(context, 48),
                minWidth: UIConverter.getComponentWidth(context, 370),
                maxHeight: UIConverter.getComponentHeight(context, 48),
                maxWidth: UIConverter.getComponentWidth(context, 370),
              ),
              hintStyle: const TextStyle(color: searchHintColor),
              // hintText: "Search hospitals",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              errorText: errorText,
              prefixIcon: search,
              suffixIcon: Container(
                  child: GestureDetector(
                child: const Icon(Icons.filter_list_outlined),
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: titleTextColor,
                    context: context,
                    builder: (BuildContext context) {
                      return const FilterPage();
                    },
                  );
                },
              ))),
          onTap: () {
            setState(() {
              errorText = null;
            });
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
