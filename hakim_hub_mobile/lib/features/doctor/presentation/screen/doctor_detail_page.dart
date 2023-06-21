import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/features/doctor/presentation/bloc/doctor_detail_bloc.dart';
import 'package:hakim_hub_mobile/router/routes.dart';

import '../../../../core/utils/ui_converter.dart';

class DoctorDetailPage extends StatefulWidget {
  final doctorDetailId;
  const DoctorDetailPage({super.key, required this.doctorDetailId});

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  late DoctorDetailBloc _doctorDetailBloc;

  void initState() {
    super.initState();
    _doctorDetailBloc = BlocProvider.of<DoctorDetailBloc>(context);
    _doctorDetailBloc
        .add(GetDoctorDetailEvent(doctorDetailId: widget.doctorDetailId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailBloc, DoctorDetailState>(
      builder: (context, state) {
        if (state is DoctorDetailLoadingState) {
          return const Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        } else if (state is DoctorDetailSuccessState) {
          final doctorDetail = state.doctorDetail;
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(doctorDetail.photoUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: UIConverter.getComponentWidth(context, 38),
                      top: UIConverter.getComponentHeight(context, 20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: const CircleAvatar(
                            child: backButtonPro,
                            backgroundColor: backgroundColor,
                          ),
                          onTap: () {
                            context.pop();
                          },
                        ),
                        SizedBox(
                          height: UIConverter.getComponentHeight(context, 20),
                        ),
                        Text(
                          doctorDetail.fullName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: titleTextColor,
                              fontSize: 25),
                          maxLines: 1,
                        ),
                        Text("$doctorDetail.specialities[0]",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: titleTextColor,
                                fontSize: 19),
                            maxLines: 1),
                        SizedBox(
                          height: UIConverter.getComponentHeight(context, 10),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_alarm,
                              color: primaryColor,
                              size: 30,
                            ),
                            SizedBox(
                              width: UIConverter.getComponentWidth(context, 12),
                            ),
                            Column(
                              children: [
                                Text(
                                    "+ {$doctorDetail.yearsOfExperience} years",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: primaryColor,
                                        fontSize: 19),
                                    maxLines: 1),
                                const Text("Experience",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: titleTextColor,
                                        fontSize: 15),
                                    maxLines: 1),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                            height:
                                UIConverter.getComponentHeight(context, 20)),
                        const Row(
                          children: [
                            Icon(
                              Icons.local_hospital,
                              color: primaryColor,
                              size: 20,
                            ),
                            Text("${doctorDetail.mainInstitutionName}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor,
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
                  top: UIConverter.getComponentHeight(context, 275),
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: UIConverter.getComponentWidth(context, 38),
                        right: UIConverter.getComponentWidth(context, 38),
                        bottom: UIConverter.getComponentHeight(context, 15),
                        top: UIConverter.getComponentHeight(context, 20)),
                    decoration: BoxDecoration(
                        color: secondryTextColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                UIConverter.getComponentWidth(context, 15)),
                            topRight: Radius.circular(
                                UIConverter.getComponentWidth(context, 15)))),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              biography,
                              SizedBox(
                                width:
                                    UIConverter.getComponentWidth(context, 9),
                              ),
                              const Text("Biography",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: bioTextColor,
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
                                color: primaryTextColor,
                                fontSize: 13),
                          ),
                          SizedBox(
                            height: UIConverter.getComponentHeight(context, 30),
                          ),
                          Row(
                            children: [
                              educationIcon,
                              SizedBox(
                                width:
                                    UIConverter.getComponentWidth(context, 10),
                              ),
                              const Text(
                                "Education",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: bioTextColor,
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
                                width:
                                    UIConverter.getComponentWidth(context, 6),
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
                                            color: degreeTextColor,
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
                                            color: degreeTextColor,
                                            fontSize: 11),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "University of Indonesia",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: degreeTextColor,
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
                              const Icon(
                                Icons.cast_for_education,
                                size: 30,
                              ),
                              SizedBox(
                                width:
                                    UIConverter.getComponentWidth(context, 6),
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
                                            color: degreeTextColor,
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
                                            color: degreeTextColor,
                                            fontSize: 11),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "University of Indonesia",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: degreeTextColor,
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
      },
    );
  }
}
