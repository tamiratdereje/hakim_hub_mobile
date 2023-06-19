import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/pixle_to_percent.dart';

class HowAreYouFeeling extends StatefulWidget {
  const HowAreYouFeeling({super.key});

  @override
  State<HowAreYouFeeling> createState() => _HowAreYouFeelingState();
}

class _HowAreYouFeelingState extends State<HowAreYouFeeling> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: pixleToPercent(8, "width").w,
        ),
        width: double.infinity,
        height: pixleToPercent(56, "height").h,
        decoration: BoxDecoration(
          color: const Color(0XFFEDEDED),
          borderRadius: BorderRadius.all(
            Radius.circular(
              pixleToPercent(26, "height").h,
            ),
          ),
        ),
        child: ListTile(
          leading: Icon(
            Icons.person_2_outlined,
            size: pixleToPercent(20, "width").w,
          ),
          title: Text(
            "How are you feeling?",
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
          trailing: Icon(
            Icons.send,
            color: Colors.blue,
            size: pixleToPercent(20, "width").w,
          ),
        ));
  }
}
