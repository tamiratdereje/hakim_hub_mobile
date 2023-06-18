import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/pixle_to_percent.dart';
import '../../../../core/utils/ui_converter.dart';
import '../../../hospital/presentation/widgets/main_hospitals_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Adaptive.w(pixleToPercent(40, "width")),
                vertical: Adaptive.h(pixleToPercent(40, "height"))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/homepage_image.png'),
                  ),
                  Text(
                    "HakimHub",
                    style: TextStyle(
                        fontSize: 24.sp,
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
                    height: Adaptive.h(pixleToPercent(33, "height")),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Adaptive.h(pixleToPercent(8, "width"))),
                      width: double.infinity,
                      height: Adaptive.h(pixleToPercent(56, "height")),
                      decoration: BoxDecoration(
                        color: const Color(0XFFEDEDED),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            Adaptive.h(
                              pixleToPercent(26, "height"),
                            ),
                          ),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.person_2_outlined),
                          Text("How are you feeling?"),
                          Icon(
                            Icons.send,
                            color: Colors.blue,
                          )
                        ],
                      )),
                  SizedBox(
                    height: Adaptive.h(pixleToPercent(10, "height")),
                  ),
                ]),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: Adaptive.w(pixleToPercent(10, "width"))),
            child: SizedBox(
              height: Adaptive.h(pixleToPercent(400, "height")),
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return MainHospitalsCard();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: Adaptive.w(pixleToPercent(25, "width")),
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
