
import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';

import '../../../../core/shared_widgets/formfield.dart';



Widget chipsContainer(String name) {
  return Container(
    margin: const EdgeInsets.only(right: 5),
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 4),
    width: 70,
    height: 22,
    decoration: const BoxDecoration(
        color: chipColor, borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Text(
      name,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    ),
  );
}
