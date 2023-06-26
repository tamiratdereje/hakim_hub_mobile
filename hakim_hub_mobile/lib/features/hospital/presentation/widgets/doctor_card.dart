import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';

class DoctorCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  DoctorCard(
      {required this.imageUrl, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: UIConverter.getComponentHeight(context, 5),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildCard(context, title, subtitle),
          Positioned(
            top: -UIConverter.getComponentHeight(context, 5),
            child: CircleAvatar(
              radius: UIConverter.getComponentHeight(context, 83) / 2,
              backgroundImage: NetworkImage(imageUrl),
              onBackgroundImageError: (exception, stackTrace) {
                AssetImage(imageUrl);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCard(
    BuildContext context, String doctorName, String doctorSpecialization) {
  return Card(
    color: Colors.white,
    shadowColor: Colors.black,
    elevation: UIConverter.getComponentHeight(context, 8),
    child: SizedBox(
      height: UIConverter.getComponentHeight(context, 135.69),
      width: UIConverter.getComponentWidth(context, 190.22),
      child: Padding(
        padding:
            EdgeInsets.only(top: UIConverter.getComponentHeight(context, 7)),
        child: Column(
          children: [
            SizedBox(
              height: UIConverter.getComponentHeight(context, 72),
            ),
            Text(
              doctorName,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: 'Poppins',
                fontSize: UIConverter.getComponentHeight(context, 17),
              ),
            ),
            Text(
              doctorSpecialization,
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: UIConverter.getComponentHeight(context, 14)),
            ),
          ],
        ),
      ),
    ),
  );
}
