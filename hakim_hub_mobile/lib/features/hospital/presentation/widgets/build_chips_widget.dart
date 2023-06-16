import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';

import '../../../../core/shared_widgets/formfield.dart';


class BuildChip extends StatefulWidget {
  String label;
  Function onDeleted;
  Function onAdd;
  BuildChip(
      {required this.label, required this.onDeleted, required this.onAdd});

  @override
  State<BuildChip> createState() => _BuildChipState();
}

class _BuildChipState extends State<BuildChip> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InputChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      disabledColor: greyColor,
      selected: _isSelected,
      onSelected: (bool value) {
        setState(() {
          _isSelected = value;
        });
        if (_isSelected) {
          widget.onAdd(widget.label);
        } else {
          widget.onDeleted(widget.label);
        }
      },
      labelPadding: EdgeInsets.all(UIConverter.getComponentWidth(context,2.0)),
      label: Text(
        widget.label,
        style: const TextStyle(
          color: primaryTextColor,
        ),
      ),
      backgroundColor: secondryTextColor,
      padding: EdgeInsets.all(UIConverter.getComponentWidth(context, 8)),
    );
  }
}