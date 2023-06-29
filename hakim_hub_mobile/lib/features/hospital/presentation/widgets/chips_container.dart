import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/shared_widgets/formfield.dart';
import '../../../../core/utils/pixle_to_percent.dart';

Widget chipsContainer(String name) {
  return Container(
    margin: const EdgeInsets.only(right: 5),
    padding: EdgeInsets.symmetric(
        horizontal: pixleToPercent(16, "width").w,
        vertical: pixleToPercent(6, "height").h),
    width: pixleToPercent(85, "width").w,
    height: pixleToPercent(32, "height").h,
    decoration: const BoxDecoration(
        color: chipColor, borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Text(
      name,
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
    ),
  );
}
