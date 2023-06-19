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
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(
          top: UIConverter.getComponentHeight(context, 28.31),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            buildCard(context),
            Positioned(
              top: -UIConverter.getComponentHeight(context, 28),
              child: CircleAvatar(
                radius: UIConverter.getComponentHeight(context, 83) / 2,
                backgroundImage: AssetImage(imageUrl),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildCard(BuildContext context) {
  var chiptextColor2;
  return Card(
    color: Colors.white,
    shadowColor: Colors.black,
    child: SizedBox(
      height: UIConverter.getComponentHeight(context, 135.69),
      width: UIConverter.getComponentWidth(context, 179.22),
      child: Column(
        children: [
          SizedBox(
            height: UIConverter.getComponentHeight(context, 72),
          ),
          Text(
            'Dr.Daniel Doe',
            style: TextStyle(color: primaryTextColor),
          ),
          Text(
            'Neurologist',
            style: TextStyle(
              color: chiptextColor2,
            ),
          ),
        ],
      ),
    ),
  );
}
