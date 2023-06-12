import 'package:flutter/material.dart';

import '../../../../core/utils/ui_converter.dart';

class DoctorDetailPage extends StatefulWidget {
  const DoctorDetailPage({super.key});

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
              child: Container(
            height: double.infinity,
            width: double.infinity,
          )),
          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/doctor_image.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 38, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.arrow_back),
                    backgroundColor: Color(0XFFEFF3F3),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Dr. Andus Huda",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF3F3F3F),
                        fontSize: 25),
                    maxLines: 1,
                  ),
                  Text("Tooth Specialist .",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF3F3F3F),
                          fontSize: 19),
                      maxLines: 1),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_alarm,
                        color: Color(0XFF68A4F4),
                        size: 30,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        children: [
                          Text("+3 years",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0XFF68A4F4),
                                  fontSize: 19),
                              maxLines: 1),
                          Text("Experience",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF3F3F3F),
                                  fontSize: 15),
                              maxLines: 1),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_hospital,
                        color: Color(0XFF68A4F4),
                        size: 20,
                      ),
                      Text("Tikur Anbessa",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF68A4F4),
                            fontSize: 15,
                          ),
                          maxLines: 1)
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 275,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 38, right: 38, bottom: 15, top: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: const SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.menu),
                        SizedBox(
                          width: 9,
                        ),
                        Text("Biography",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0XFF606060),
                                fontSize: 20),
                            maxLines: 1),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Madison Blackstone is a director of brand marketing, with experience managing global teams and multi-million-dollar campaigns. Her background in brand strategy, visual design, and account management inform her mindful but competitive approach. Madison is fueled by her passion for understanding the nuances of cross-cultural advertising. Madison Blackstone is a director of brand marketing, a director of brand marketing, with experience managing global teams and multi-million-dollar campaigns. Her background in brand strategy, visual design, and account management inform her mindful but competitive approach. Madison is fueled by her passion for understanding the nuances of cross-cultural advertising. Madison Blackstone is a director of brand market a director of brand marketing, with experience managing global teams and multi-million-dollar campaigns. Her background in brand strategy, visual design, and account management inform her mindful but competitive approach. Madison is fueled by her passion for understanding the nuances of cross-cultural advertising. Madison Blackstone is a director of brand market with experience managing global teams and multi-million-dollar campaigns. Her background in brand strategy, visual design, and account management inform her mindful but competitive approach. Madison is fueled by her passion for understanding the nuances of cross-cultural advertising. ",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: 13),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Icon(Icons.cast_for_education),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Education",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF606060),
                              fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.cast_for_education,
                          size: 30,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Bachelor of Medicine",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0XFF8B8B8B),
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "Oct 2016 - Oct 2019",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF8B8B8B),
                                      fontSize: 11),
                                )
                              ],
                            ),
                            Text(
                              "University of Indonesia",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF8B8B8B),
                                  fontSize: 11),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.cast_for_education,
                          size: 30,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Bachelor of Medicine",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0XFF8B8B8B),
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "Oct 2016 - Oct 2019",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF8B8B8B),
                                      fontSize: 11),
                                )
                              ],
                            ),
                            Text(
                              "University of Indonesia",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF8B8B8B),
                                  fontSize: 11),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}