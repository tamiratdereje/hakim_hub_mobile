import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/pixle_to_percent.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_search_domain.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/shared_widgets/formfield.dart';
import 'chips_container.dart';

class MainHospitalsCard extends StatelessWidget {
  final InstitutionSearchDomain institutionSearchDomain;
  MainHospitalsCard({required this.institutionSearchDomain ,super.key});

  bool isOpened = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10, top: 10, left: 0, right: 0),
        width: pixleToPercent(370, 'width').w,
        height: pixleToPercent(305, 'height').h,
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
            width: pixleToPercent(370, 'width').w,
            height: pixleToPercent(146, 'height').h,
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage(institutionSearchDomain.bannerUrl, ),
                  fit:BoxFit.cover,
                  onError: (_, __) {
                    // Handle error by providing a fallback image
                    const AssetImage('assets/images/hospital_img.png');
                  },
                  
                  ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: pixleToPercent(20, 'width').w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: UIConverter.getComponentWidth(context, 176),
                  child:  Text(institutionSearchDomain.institutionName ,
                      style: TextStyle(
                          color: titleTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                      maxLines: 1),
                ),
                Row(
                  children: [
                    alarm,
                    SizedBox(width: UIConverter.getComponentWidth(context, 5)),
                    Text("${institutionSearchDomain.institutionAvailability.opening.substring(0,2)}am-${institutionSearchDomain.institutionAvailability.closing.substring(0,2)}pm",
                        style: const TextStyle(
                            color: titleTextColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                        maxLines: 1),
                  ],
                ),
                SizedBox(
                  height: 15.sp,
                ),
                SizedBox(
                  width: pixleToPercent(300, 'width').w,
                  height: pixleToPercent(32, 'height').h,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: institutionSearchDomain.services.length,
                    itemBuilder: ((context, index) {
                      print(institutionSearchDomain.services[index]);
                      return chipsContainer(institutionSearchDomain.services[index]);
                    }),
                  ),
                ),
                SizedBox(
                  height: pixleToPercent(17, 'height').h,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: pixleToPercent(20, 'width').w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                location,
                SizedBox(
                  width: UIConverter.getComponentWidth(context, 5),
                ),
                 SizedBox(
                  width: pixleToPercent(300, 'width').w,
                   child: Text(
                    
                    institutionSearchDomain.address.summary,
                    style: const TextStyle(
                      
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.end,
                    maxLines: 1,
                                 ),
                 )
              ],
            ),
          )
        ]),
      ),
      Positioned(
        child: Container(
          width: UIConverter.getComponentWidth(context, 74),
          height: UIConverter.getComponentHeight(context, 29),
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            color: backgroundColor,
          ),
          margin: EdgeInsets.only(
            bottom: UIConverter.getComponentHeight(context, 10),
            top: UIConverter.getComponentHeight(context, 10),
          ),
          child: Center(
            child: Text(
              institutionSearchDomain.status,
              style: TextStyle(
                  color: institutionSearchDomain.status.toLowerCase() == "open" ? greenColor : redColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
          ),
        ),
      )
    ]);
  }
}
