import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';

import '../../../../core/utils/colors.dart';
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
              height: UIConverter.getComponentHeight(context, 300),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/doctor_image.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: UIConverter.getComponentWidth(context, 38),
                    top: UIConverter.getComponentHeight(context, 20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      child: Icon(Icons.arrow_back),
                      backgroundColor: backgroundColor,
                    ),
                    SizedBox(
                      height: UIConverter.getComponentHeight(context, 20),
                    ),
                    const Text(
                      "Dr. Andus Huda",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF3F3F3F),
                          fontSize: 25),
                      maxLines: 1,
                    ),
                    const Text("Tooth Specialist .",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF3F3F3F),
                            fontSize: 19),
                        maxLines: 1),
                    SizedBox(
                      height: UIConverter.getComponentHeight(context, 10),
                    ),
                    Row(
                      children: [
                        clock,
                        SizedBox(
                          width: UIConverter.getComponentWidth(context, 12),
                        ),
                        const Column(
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
                      height: UIConverter.getComponentHeight(context, 20),
                    ),
                    const Row(
                      children: [
                        hospitalsIcon,
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
                padding: EdgeInsets.only(
                    left: UIConverter.getComponentWidth(context, 38),
                    right: UIConverter.getComponentWidth(context, 38),
                    bottom: UIConverter.getComponentHeight(context, 15),
                    top: UIConverter.getComponentHeight(context, 15)),
                decoration: BoxDecoration(
                    color: secondryTextColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            UIConverter.getComponentHeight(context, 15)),
                        topRight: Radius.circular(
                            UIConverter.getComponentHeight(context, 15)))),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          biography,
                          SizedBox(
                            width: UIConverter.getComponentWidth(context, 9),
                          ),
                          const Text("Biography",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0XFF606060),
                                  fontSize: 20),
                              maxLines: 1),
                        ],
                      ),
                      SizedBox(
                        height: UIConverter.getComponentHeight(context, 10),
                      ),
                      const Text(
                        "Madison Blackstone is a director of brand marketing, with experience managing global teams and multi-million-dollar campaigns. Her background in brand strategy, visual design, and account management inform her mindful but competitive approach. Madison is fueled by her passion for understanding the nuances of cross-cultural advertising. Madison Blackstone is a director of brand marketing, a director of brand marketing, with experience managing global teams and multi-million-dollar campaigns. Her background in brand strategy, visual design, and account management inform her mindful but competitive approach. Madison is fueled by her passion for understanding the nuances of cross-cultural advertising. Madison Blackstone is a director of brand market a director of brand marketing, with experience managing global teams and multi-million-dollar campaigns. Her background in brand strategy, visual design, and account management inform her mindful but competitive approach. Madison is fueled by her passion for understanding the nuances of cross-cultural advertising. Madison Blackstone is a director of brand market with experience managing global teams and multi-million-dollar campaigns. Her background in brand strategy, visual design, and account management inform her mindful but competitive approach. Madison is fueled by her passion for understanding the nuances of cross-cultural advertising. ",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: UIConverter.getComponentHeight(context, 30),
                      ),
                      Row(
                        children: [
                          Icon(Icons.cast_for_education),
                          SizedBox(
                            width: UIConverter.getComponentWidth(context, 10),
                          ),
                          const Text(
                            "Education",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0XFF606060),
                                fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: UIConverter.getComponentHeight(context, 10),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.cast_for_education,
                            size: 30,
                          ),
                          SizedBox(
                            width: UIConverter.getComponentWidth(context, 6),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Bachelor of Medicine",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0XFF8B8B8B),
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: UIConverter.getComponentWidth(
                                        context, 7),
                                  ),
                                  const Text(
                                    "Oct 2016 - Oct 2019",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0XFF8B8B8B),
                                        fontSize: 11),
                                  )
                                ],
                              ),
                              const Text(
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
                        height: UIConverter.getComponentHeight(context, 10),
                      ),
                      Row(
                        children: [
                          educationIcon,
                          SizedBox(
                            width: UIConverter.getComponentWidth(context, 6),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                 const Text(
                                    "Bachelor of Medicine",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0XFF8B8B8B),
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: UIConverter.getComponentWidth(context, 7) ,
                                  ),
                                  const Text(
                                    "Oct 2016 - Oct 2019",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0XFF8B8B8B),
                                        fontSize: 11),
                                  )
                                ],
                              ),
                              const Text(
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
      ),
    );
  }
}
