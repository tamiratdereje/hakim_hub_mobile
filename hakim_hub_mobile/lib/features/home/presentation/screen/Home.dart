import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/router/routes.dart';
import '../../../../core/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/pixle_to_percent.dart';
import '../widgets/hospital_card.dart';
import '../widgets/how_are_you_feeling.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: pixleToPercent(40, "width").w,
                  vertical: pixleToPercent(40, "height").h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/homepage.svg',
                    ),
                    Text(
                      "HakimHub",
                      style: TextStyle(
                          fontSize: 23.sp,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: Adaptive.h(pixleToPercent(5, "height")),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Provide easily accessible information about healthcare facilities and healthcare professionals',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: pixleToPercent(30, "height").h,
                    ),
                    const HowAreYouFeeling(),
                    SizedBox(
                      height: Adaptive.h(pixleToPercent(10, "height")),
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: pixleToPercent(10, "width").w),
              child: SizedBox(
                height: pixleToPercent(400, "height").h,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: HospitalsCard(),
                      onTap: () {
                        context.pushNamed(AppRoutes.HospitalDetailPage,
                            queryParameters: {"id": "id"});
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: pixleToPercent(25, "width").w,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
