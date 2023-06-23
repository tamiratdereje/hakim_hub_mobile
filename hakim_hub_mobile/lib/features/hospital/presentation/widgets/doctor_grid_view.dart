import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_doctor_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_card.dart';

import '../../../../core/utils/colors.dart';
import '../../../../router/routes.dart';
import '../../domain/entities/filter_doctor_domain.dart';
import 'doctor_filter_page.dart';

class DoctorGridView extends StatelessWidget {
  List<String> filterList;
  final String institutionId;
  Function onFilterChanged;
  List<DoctorDomain> doctors;
  DoctorGridView(
      {Key? key,
      required this.doctors,
      required this.filterList,
      required this.onFilterChanged,
      required this.institutionId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: UIConverter.getComponentHeight(context, 20),
        top: UIConverter.getComponentHeight(context, 20),
        left: UIConverter.getComponentWidth(context, 10),
        right: UIConverter.getComponentWidth(context, 10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Doctors in this hospital"),
              Row(
                children: [
                  const Text("Filter", style: TextStyle(color: Colors.blue)),
                  GestureDetector(
                    child:
                        const Icon(Icons.arrow_drop_down, color: Colors.black),
                    onTap: () async {
                      DoctorFilterDomain doctorFilterDomain =
                          (await showModalBottomSheet<DoctorFilterDomain>(
                        isScrollControlled: true,
                        backgroundColor: titleTextColor,
                        context: context,
                        builder: (BuildContext context) {
                          return DoctorFilterPage(
                            filterList: filterList,
                            institutionId: institutionId,
                          );
                        },
                      ))!;
                      print("anything");
                      onFilterChanged(doctorFilterDomain);
                    },
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              itemCount: doctors.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Change this to 4 for a 4x4 grid
                crossAxisSpacing: UIConverter.getComponentWidth(context, 17.78),
                mainAxisSpacing: UIConverter.getComponentHeight(context, 28.31),
                childAspectRatio:
                    UIConverter.getComponentWidth(context, 179.22) /
                        UIConverter.getComponentHeight(context, 139.69),
              ),
              itemBuilder: (BuildContext context, int index) {
                final doctor = doctors[index];
                return GestureDetector(
                  child: DoctorCard(
                    imageUrl: doctor.photoUrl,
                    title: doctor.fullName,
                    subtitle: doctor.specialities.join(", "),
                  ),
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.DoctorDetailPage,
                      queryParameters: {"id": doctor.id},
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
