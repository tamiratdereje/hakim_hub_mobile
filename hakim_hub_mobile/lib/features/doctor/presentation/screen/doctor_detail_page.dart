import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/features/doctor/presentation/bloc/doctor_detail_bloc.dart';
import 'package:hakim_hub_mobile/router/routes.dart';

import '../../../../core/utils/ui_converter.dart';

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
                      image: NetworkImage(doctorDetail.photoUrl,
                      ),
                      onError: (_, __) {
                        // Handle error by providing a fallback image
                        const AssetImage('assets/images/hospital_img.png');
                      },
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
                            backgroundColor: backgroundColor,
                            child: backButtonPro,
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
                        Text("dfefefe",
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
                                    "+ ${doctorDetail.yearsOfExperience} years",
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
                        Row(
                          children: [
                            const Icon(
                              Icons.local_hospital,
                              color: primaryColor,
                              size: 20,
                            ),
                            Text(doctorDetail.mainInstitutionName,
                                style: const TextStyle(
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
                          Text(
                            doctorDetail.about,
                            style: const TextStyle(
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
                              Expanded(child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
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
                                            width:
                                                UIConverter.getComponentWidth(
                                                    context, 7),
                                          ),
                                          Text(
                                            "${doctorDetail.educations[index].startDate} - ${doctorDetail.educations[index].endDate}",
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400,
                                                color: degreeTextColor,
                                                fontSize: 11),
                                          )
                                        ],
                                      ),
                                      Text(
                                        doctorDetail
                                            .educations[index].institution,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: degreeTextColor,
                                            fontSize: 11),
                                      )
                                    ],
                                  );
                                },
                              )),
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
      return const Center(child: Text("Couldn't load doctor"));
    });
  }
}
