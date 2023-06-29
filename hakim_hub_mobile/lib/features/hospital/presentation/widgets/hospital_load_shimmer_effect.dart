import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/pixle_to_percent.dart';
import '../../../../core/utils/ui_converter.dart';
import 'hospital_text_field.dart';

class HospitalLoadShimmerEffect extends StatefulWidget {
  const HospitalLoadShimmerEffect({super.key});

  @override
  State<HospitalLoadShimmerEffect> createState() =>
      _HospitalLoadShimmerEffectState();
}

class _HospitalLoadShimmerEffectState extends State<HospitalLoadShimmerEffect> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Hospitals",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: UIConverter.getComponentWidth(context, 370),
                height: UIConverter.getComponentHeight(context, 48),
                color: Colors.white,
                child: HospitalSearchField(
                  enabled: false,
                  filterList: const ['nothing'],
                  controller: _controller,
                  hintText: "Search hospitals",
                  obscureText: false,
                  onChanged: (searchName) {
                    () {};
                  },
                  onFilterChanged: (value) {
                    () {};
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              hospitalCard(),
              const SizedBox(
                height: 25,
              ),
              hospitalCard(),
              const SizedBox(
                height: 25,
              ),
              hospitalCard()
            ],
          ),
        ),
      ),
    );
  }

  Container multiLineTextShimmer(width, height) {
    return Container(
      width: pixleToPercent(width, 'width').w,
      height: pixleToPercent(height, 'height').h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: shimmerColor,
      ),
    );
  }

  Container textShimmer({width, height = 14}) {
    return Container(
      width: pixleToPercent(width, "width").w,
      height: 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: shimmerColor,
      ),
    );
  }

  Text appBarTexts(String text, isSelected) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13,
        decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
        decorationColor: Colors.blue,
        decorationThickness: 3,
      ),
    );
  }

  Widget hospitalCard() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(113, 170, 166, 166),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          multiLineTextShimmer(
              double.infinity, pixleToPercent(290, 'height').h),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textShimmer(width: 250),
              const SizedBox(
                width: 60,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textShimmer(width: 60),
              textShimmer(width: 60),
              const SizedBox(
                width: 110,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textShimmer(width: 80),
              textShimmer(width: 80),
              textShimmer(width: 80),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
