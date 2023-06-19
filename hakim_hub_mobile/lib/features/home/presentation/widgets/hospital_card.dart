import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/pixle_to_percent.dart';
import '../../../hospital/presentation/widgets/chips_container.dart';

class HospitalsCard extends StatelessWidget {
  HospitalsCard({super.key});

  List chipList = ["Cardio", "Generel", "Pediatrics"];
  List hospitals = ["Tikur Ambesa", "Paulos"];
  bool isOpened = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: pixleToPercent(301, "width").w,
        height: pixleToPercent(230, "height").h,
        decoration: const BoxDecoration(
            color: secondryTextColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: hospitalBorderShadowColor,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                  spreadRadius: 0.5)
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: pixleToPercent(301, "width").w,
            height: pixleToPercent(114, "height").h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                  image: AssetImage("assets/images/hospital_img.png"),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: pixleToPercent(10, "height").h,
          ),
          Padding(
            padding: EdgeInsets.only(left: pixleToPercent(20, "width").w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tikur Ambesa",
                  style: TextStyle(
                      color: titleTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                  maxLines: 1,
                ),
                SizedBox(
                  height: pixleToPercent(10, "height").h,
                ),
                SizedBox(
                  width: pixleToPercent(300, "width").w,
                  height: pixleToPercent(35, "height").h,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      return chipsContainer(chipList[index]);
                    }),
                  ),
                ),
                SizedBox(
                  height: pixleToPercent(7, "height").h,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.location_on,
                  size: pixleToPercent(23, "height").h,
                ),
                SizedBox(
                  width: pixleToPercent(5, "width").w,
                ),
                Text(
                  "King George Street",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    ]);
  }
}
