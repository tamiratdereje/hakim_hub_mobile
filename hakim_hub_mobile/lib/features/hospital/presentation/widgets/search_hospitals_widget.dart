import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';

import '../../../../core/shared_widgets/formfield.dart';
import '../bloc/bloc/search_hospital_bloc.dart';
import 'filter_page.dart';
import 'hospital_text_field.dart';

class SearchHospitalsWidget extends StatefulWidget {
  Function onChanged;
  Function onFilterChanged;
  List<String> serviceList;
  SearchHospitalsWidget(
      {required this.serviceList,
      required this.onChanged,
      required this.onFilterChanged,
      super.key});

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
      color: Colors.white,
      child: HospitalSearchField(
        enabled: false,
        filterList: widget.serviceList,
        controller: name,
        hintText: "Search hospitals",
        obscureText: false,
        onChanged: (searchName) {
          widget.onChanged(searchName);
        },
        onFilterChanged: (value) {
          widget.onFilterChanged(value);
        },
      ),
    );
  }
}
