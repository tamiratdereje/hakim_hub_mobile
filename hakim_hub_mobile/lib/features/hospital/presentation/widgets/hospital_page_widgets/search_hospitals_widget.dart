import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/pixle_to_percent.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_page_widgets/hospital_text_field.dart';

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
      width: pixleToPercent(370, 'width'),
      height: pixleToPercent(48, 'height'),
      color: Colors.white,
      child: HospitalSearchField(
        enabled: true,
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
