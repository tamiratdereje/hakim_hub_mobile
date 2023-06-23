import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_card.dart';

import '../../../../core/utils/colors.dart';
import '../../../../router/routes.dart';
import '../../domain/entities/filter_doctor_domain.dart';
import 'doctor_filter_page.dart';

class DoctorGridView extends StatelessWidget {
  final List<String> mockDoctors = [
    'Doctor Doe',
    'Doctor Smith',
    'Doctor Brown',
    'Doctor Johnson',
    'Doctor Doe',
    'Doctor Smith',
    'Doctor Brown',
    'Doctor Johnson',
  ];
  List<String> filterList;
  final String institutionId;
  Function onFilterChanged;
  DoctorGridView({Key? key, required this.filterList, required this.onFilterChanged, required this.institutionId}) : super(key: key);

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
                    child: const Icon(Icons.arrow_drop_down, color: Colors.black),
                    onTap: () async {
                      DoctorFilterDomain doctorFilterDomain = (await showModalBottomSheet<DoctorFilterDomain>(
                    isScrollControlled: true,
                    backgroundColor: titleTextColor,
                    context: context,
                    builder: (BuildContext context) {
                      return  DoctorFilterPage(filterList :filterList, institutionId: institutionId,);
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
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Change this to 4 for a 4x4 grid
                crossAxisSpacing: UIConverter.getComponentWidth(context, 17.78),
                mainAxisSpacing: UIConverter.getComponentHeight(context, 28.31),
                childAspectRatio: UIConverter.getComponentWidth(context, 179.22) /
                    UIConverter.getComponentHeight(context, 139.69),
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: DoctorCard(
                    imageUrl: 'assets/images/doctor_image.png',
                    title: "Dr. Doe h",
                    subtitle: 'ntist',
                  ),
                  onTap: () {
                    context.pushNamed(AppRoutes.DoctorDetailPage,
                        queryParameters: {"id": "id"});
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
