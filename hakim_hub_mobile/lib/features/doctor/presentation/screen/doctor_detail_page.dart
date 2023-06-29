import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/features/doctor/presentation/bloc/doctor_detail_bloc.dart';
import 'package:hakim_hub_mobile/router/routes.dart';

import '../../../../core/utils/ui_converter.dart';
import '../widgets/doctor_detail_shimmer.dart';

class DoctorDetailPage extends StatefulWidget {
  final String doctorDetailId;
  const DoctorDetailPage({super.key, required this.doctorDetailId});

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  late DoctorDetailBloc _doctorDetailBloc;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DoctorDetailBloc>(context)
        .add(GetDoctorDetailEvent(doctorDetailId: widget.doctorDetailId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailBloc, DoctorDetailState>(
        builder: (context, state) {
      if (state is DoctorDetailLoadingState) {
        return Scaffold(body:  DoctorDetailShimmer(),);
      } else if (state is DoctorDetailSuccessState) {
        final doctorDetail = state.doctorDetail;
        return Scaffold(
          
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.only(
                  top: UIConverter.getComponentHeight(context, 30)),
              height: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: UIConverter.getComponentHeight(context, 210),
                      width: double.infinity,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Container(
                          width: double.infinity,
                          height: UIConverter.getComponentHeight(context, 214),
                        ),
                        CircleAvatar(
                            radius:
                                UIConverter.getComponentHeight(context, 200) /
                                    2,
                            backgroundImage:
                                NetworkImage(doctorDetail.photoUrl),
                            onBackgroundImageError: (exception, stackTrace) {
                              AssetImage(doctorDetail.photoUrl);
                            }),
                        Positioned(
                          top: UIConverter.getComponentHeight(context, 0),
                          left: UIConverter.getComponentWidth(context, 20),
                          child: GestureDetector(
                            child: const CircleAvatar(
                              backgroundColor: backgroundColor,
                              child: backButtonPro,
                            ),
                            onTap: () {
                              context.pop();
                            },
                          ),
                        ),
                      ]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                        SizedBox(
                          height: UIConverter.getComponentHeight(context, 5),
                        ),
                        Text(
                            doctorDetail.specialities.length > 0
                                ? doctorDetail.specialities[0]
                                : "not specified",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: primaryColor,
                                fontSize: 16),
                            maxLines: 1),
                        SizedBox(
                          height: UIConverter.getComponentHeight(context, 5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.badge_rounded,
                              color: Colors.black,
                              size: 30,
                            ),
                            SizedBox(
                              width: UIConverter.getComponentWidth(context, 12),
                            ),
                            Text("+ ${doctorDetail.yearsOfExperience} years",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontSize: 19),
                                maxLines: 1),
                            SizedBox(
                              width: UIConverter.getComponentWidth(context, 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: UIConverter.getComponentHeight(context, 40),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: UIConverter.getComponentWidth(context, 38),
                          right: UIConverter.getComponentWidth(context, 38),
                          bottom: UIConverter.getComponentHeight(context, 15),
                          top: UIConverter.getComponentHeight(context, 20)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  UIConverter.getComponentWidth(context, 15)),
                              topRight: Radius.circular(
                                  UIConverter.getComponentWidth(context, 15)))),
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
                          Text(
                            doctorDetail.about,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: bioTextColor,
                                fontSize: 15),
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
                          doctorDetail.educations.isNotEmpty
                              ? SizedBox(
                                  width: double.infinity,
                                  height: UIConverter.getComponentHeight(
                                      context, 100),
                                  child: ListView.builder(
                                    // physics: NeverScrollableScrollPhysics(),
                                    // shrinkWrap: true,
                                    itemCount: doctorDetail.educations.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                doctorDetail
                                                    .educations[index].degree,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: degreeTextColor,
                                                    fontSize: 14),
                                              ),
                                              SizedBox(
                                                width: UIConverter
                                                    .getComponentWidth(
                                                        context, 7),
                                              ),
                                              Text(
                                                "${doctorDetail.educations[index].startDate} - ${doctorDetail.educations[index].endDate}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    color: primaryTextColor,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                UIConverter.getComponentHeight(
                                                    context, 5),
                                          ),
                                          Text(
                                            doctorDetail
                                                .educations[index].institution,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: primaryTextColor,
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            height:
                                                UIConverter.getComponentHeight(
                                                    context, 10),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return const Center(child: Text("Couldn't load doctor"));
    });
  }
}
