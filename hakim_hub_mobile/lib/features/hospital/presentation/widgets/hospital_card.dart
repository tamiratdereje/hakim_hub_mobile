import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';

class HospitalCard extends StatelessWidget {
  final double width = 347;
  final double height = 106;
  final double initialSize = 74;

  const HospitalCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double proportionalFontSize = 14 * screenWidth / 375;
    String globe_location = 'asssets/images/globe_icon_image.svg';

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: UIConverter.getComponentHeight(context, height),
          width: UIConverter.getComponentWidth(context, width),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: UIConverter.getComponentHeight(context, initialSize),
                width: UIConverter.getComponentWidth(context, initialSize),
                child: Column(
                  children: [
                    Container(
                      height: UIConverter.getComponentHeight(context, 45),
                      width: UIConverter.getComponentWidth(context, 45),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(239, 243, 243, 1),
                      ),
                      child: SizedBox(
                        height: UIConverter.getComponentHeight(context, 16.67),
                        width: UIConverter.getComponentWidth(context, 16.67),
                        child: SvgPicture.asset(globe_location),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Website',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: proportionalFontSize),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: UIConverter.getComponentHeight(context, initialSize),
                width: UIConverter.getComponentWidth(context, initialSize),
                child: Column(
                  children: [
                    Container(
                      height: UIConverter.getComponentHeight(context, 45),
                      width: UIConverter.getComponentWidth(context, 45),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(239, 243, 243, 1)),
                      child: SizedBox(
                        height: UIConverter.getComponentHeight(context, 16.67),
                        width: UIConverter.getComponentWidth(context, 16.67),
                        child: const Icon(Icons.email),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Email',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: proportionalFontSize),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: UIConverter.getComponentHeight(context, initialSize),
                width: UIConverter.getComponentWidth(context, initialSize),
                child: Column(
                  children: [
                    Container(
                      height: UIConverter.getComponentHeight(context, 45),
                      width: UIConverter.getComponentWidth(context, 45),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(239, 243, 243, 1)),
                      child: SizedBox(
                        height: UIConverter.getComponentHeight(context, 16.67),
                        width: UIConverter.getComponentWidth(context, 16.67),
                        child: const Icon(Icons.directions),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Directions',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: proportionalFontSize),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: UIConverter.getComponentHeight(context, initialSize),
                width: UIConverter.getComponentWidth(context, initialSize),
                child: Column(
                  children: [
                    Container(
                      height: UIConverter.getComponentHeight(context, 45),
                      width: UIConverter.getComponentWidth(context, 45),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(239, 243, 243, 1)),
                      child: SizedBox(
                        height: UIConverter.getComponentHeight(context, 16.67),
                        width: UIConverter.getComponentWidth(context, 16.67),
                        child: const Icon(Icons.phone),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Phone',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: proportionalFontSize),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
