import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';

import '../../../../core/shared_widgets/formfield.dart';
import 'filter_page.dart';



class SearchHospitalsWidget extends StatefulWidget {
  const SearchHospitalsWidget({super.key});

  @override
  State<SearchHospitalsWidget> createState() => _SearchHospitalsWidgetState();
}

class _SearchHospitalsWidgetState extends State<SearchHospitalsWidget> {
  TextEditingController name = TextEditingController();
  String? errorText = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIConverter.getComponentWidth(context, 370),
      height: UIConverter.getComponentHeight(context, 48),
      child: Row(
        children: [
          FormField(
            builder: (FormFieldState state) {
              return TextField(
                obscureText: false,
                controller: name,
                decoration: InputDecoration(
                    constraints: BoxConstraints(
                      minHeight: UIConverter.getComponentHeight(context, 48),
                      minWidth: UIConverter.getComponentWidth(context, 370),
                      maxHeight: UIConverter.getComponentHeight(context, 48),
                      maxWidth: UIConverter.getComponentWidth(context, 370),
                    ),
                    hintStyle: const TextStyle(color: searchHintColor),
                    hintText: "Search hospitals",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorText: errorText,
                    prefixIcon: search,
                    suffixIcon: Container(
                        child: GestureDetector(
                      child: Icon(Icons.filter_list_outlined),
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
                  errorText = ' hospitals name is required';
                });
                return '';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}