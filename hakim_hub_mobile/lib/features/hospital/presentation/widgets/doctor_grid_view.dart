import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_card.dart';

import '../../../../router/routes.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: UIConverter.getComponentHeight(context, 20),
        top: UIConverter.getComponentHeight(context, 20),
        left: UIConverter.getComponentWidth(context, 10),
        right: UIConverter.getComponentWidth(context, 10),
      ),
      child: GridView.builder(
        itemCount: mockDoctors.length,
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
              title: mockDoctors[index],
              subtitle: 'ntist',
            ),
            onTap: () {
              context.pushNamed(AppRoutes.DoctorDetailPage,
                  queryParameters: {"id": "id"});
            },
          );
        },
      ),
    );
  }
}
