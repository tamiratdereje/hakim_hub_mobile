import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';

import '../../../../core/shared_widgets/formfield.dart';
import 'chips_container.dart';

class MainHospitalsCard extends StatelessWidget {
  MainHospitalsCard({super.key});

  List chipList = ["Cardio", "Generel", "Pediatrics"];
  bool isOpened = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: UIConverter.getComponentWidth(context, 370),
        height: UIConverter.getComponentHeight(context, 295),
        decoration: const BoxDecoration(
            color: secondryTextColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: greyColor,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                  spreadRadius: 0.5)
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: UIConverter.getComponentWidth(context, 370),
            height: UIConverter.getComponentHeight(context, 146),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                  image: AssetImage("assets/images/hospital_img.png"),
                  fit: BoxFit.fill),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: UIConverter.getComponentWidth(context, 176),
                  child: const Text("Tikur Ambesa",
                      style: TextStyle(
                          color: titleTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      maxLines: 1),
                ),
                Row(
                  children: [
                    alarm,
                    SizedBox(width: UIConverter.getComponentWidth(context, 5)),
                    const Text("9am-5pm",
                        style: TextStyle(
                            color: titleTextColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                        maxLines: 1),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: UIConverter.getComponentWidth(context, 300),
                  height: UIConverter.getComponentHeight(context, 25),
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
                  height: UIConverter.getComponentHeight(context, 17),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                location,
                SizedBox(
                  width: UIConverter.getComponentWidth(context, 5),
                ),
                const Text(
                  "King George Street",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
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
              isOpened ? "Open" : "Closed",
              style: TextStyle(
                  color: isOpened ? greenColor : redColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
          ),
        ),
      )
    ]);
  }
}
