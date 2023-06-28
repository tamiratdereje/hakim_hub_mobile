import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/pixle_to_percent.dart';

class DoctorDetailShimmer extends StatelessWidget {
  const DoctorDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: pixleToPercent(100, 'width').w,
                height: pixleToPercent(100, 'height').h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    pixleToPercent(100, 'width').w,
                  ),
                  color: shimmerColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: pixleToPercent(280, "width").w,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: shimmerColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: pixleToPercent(200, "width").w,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: shimmerColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: pixleToPercent(20, "width").w,
                    height: pixleToPercent(20, "height").h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: shimmerColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: pixleToPercent(150, "width").w,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: shimmerColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              // Biography
              WidgetAndText(),
              const SizedBox(
                height: 10,
              ),
              // Education
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: pixleToPercent(300, 'width').w,
                    height: pixleToPercent(300, 'height').h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: shimmerColor,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              // Education
              const WidgetAndText(),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetAndText extends StatelessWidget {
  const WidgetAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: pixleToPercent(20, 'height').h,
          width: pixleToPercent(25, 'width').w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: shimmerColor,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 10,
          width: pixleToPercent(200, 'width').w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: shimmerColor,
          ),
        ),
        Container(
          width: pixleToPercent(100, 'width').w,
        ),
      ],
    );
  }
}
