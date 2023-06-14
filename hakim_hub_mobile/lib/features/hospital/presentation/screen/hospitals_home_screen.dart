import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';

import '../../../../core/shared_widgets/formfield.dart';

class HospitalsHomeScreen extends StatefulWidget {
  const HospitalsHomeScreen({super.key});

  @override
  State<HospitalsHomeScreen> createState() => _HospitalsHomeScreenState();
}

class _HospitalsHomeScreenState extends State<HospitalsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          left: UIConverter.getComponentWidth(context, 19),
          right: UIConverter.getComponentWidth(context, 19),
          top: UIConverter.getComponentHeight(context, 52),
          bottom: UIConverter.getComponentHeight(context, 29),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hospitals",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 29,
                  fontWeight: FontWeight.w700),
            ),
            const SearchHospitalsWidget(),
            SizedBox(
              height: UIConverter.getComponentHeight(context, 30),
            ),
            const Text(
              'Nearby Hospitals',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: titleTextColor),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 15,
                itemBuilder: ((context, index) {
                  return HospitalsCard();
                })),
          ],
        ),
      ),
    );
  }
}

class HospitalsCard extends StatelessWidget {
  HospitalsCard({super.key});

  List chipList = ["Cardio", "Generel", "Pediatrics"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: UIConverter.getComponentWidth(context, 370),
      height: UIConverter.getComponentHeight(context, 295),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(0, 3),
                spreadRadius: 0.5)
          ]),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: UIConverter.getComponentWidth(context, 370),
              height: UIConverter.getComponentHeight(context, 146),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage("assets/images/doctor_image.png"),
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
                  const Row(
                    children: [
                      alarm,
                      SizedBox(
                        width: 5,
                      ),
                      Text("9am-5pm",
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
                    width: 300,
                    height: 25,
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

            // Wrap(
            //   spacing: 6.0,
            //   runSpacing: 6.0,
            //   children: chipList.map((e) => BuildChip(label: e)).toList(),
            // ),
          ]),
    );
  }
}

class SearchHospitalsWidget extends StatefulWidget {
  const SearchHospitalsWidget({super.key});

  @override
  State<SearchHospitalsWidget> createState() => _SearchHospitalsWidgetState();
}

class _SearchHospitalsWidgetState extends State<SearchHospitalsWidget> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 150,
      // height: 100,
      // color: Colors.amberAccent,
      child: Row(
        children: [
          CSFFormField(
            controller: name,
            hintText: "Search hospitals",
            onChanged: () {},
            obscureText: false,
          ),
        ],
      ),
    );
  }
}

class BuildChip extends StatelessWidget {
  String label;
  BuildChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return InputChip(
      labelPadding: const EdgeInsets.all(2.0),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      padding: const EdgeInsets.all(8.0),
    );
  }
}

Widget chipsContainer(String name) {
  return Container(
    margin: EdgeInsets.only(right: 5),
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 4),
    width: 70,
    height: 22,
    decoration: const BoxDecoration(
        color: Color(0XFFEFF3F3),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Text(
      name,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    ),
  );
}
