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
          buildCard(context),
          Positioned(
            top: -UIConverter.getComponentHeight(context, 19),
            child: CircleAvatar(
              radius: UIConverter.getComponentHeight(context, 83) / 2,
              backgroundImage: AssetImage(imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCard(BuildContext context) {
  return Card(
    color: Colors.white,
    shadowColor: Colors.black,
    elevation: UIConverter.getComponentHeight(context, 8),
    child: SizedBox(
      height: UIConverter.getComponentHeight(context, 135.69),
      width: UIConverter.getComponentWidth(context, 190.22),
      child: Column(
        children: [
          SizedBox(
            height: UIConverter.getComponentHeight(context, 72),
          ),
          Text(
            'Dr.Daniel Doe',
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: 'Poppins',
              fontSize: UIConverter.getComponentHeight(context, 17),
            ),
          ),
          Text(
            'Neurologist',
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: UIConverter.getComponentHeight(context, 14)),
          ),
        ],
      ),
    ),
  );
}
