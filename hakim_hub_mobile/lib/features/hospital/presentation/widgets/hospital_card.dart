import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/phone_card.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/website_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'email_card.dart';
import 'popup.dart';

class HospitalCard extends StatelessWidget {
  final double width = 347;
  final double height = 106;
  final double initialSize = 74;

  const HospitalCard({super.key});

  @override
  Widget build(BuildContext context) {
    double responsiveFontSize(double baseFontSize) {
      double screenWidth = MediaQuery.of(context).size.width;
      return baseFontSize * screenWidth / 411; // 411 is a reference width
    }

    return Container(
      // body: Center(
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
                        child: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Center(child: websiteCard());
                                  });
                            },
                            icon: Icon(MdiIcons.web))),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: SizedBox(
                        width: UIConverter.getComponentWidth(context, 50),
                        child: Text(
                          'Website',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: responsiveFontSize(12)),
                        ),
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
                      color: Color.fromRGBO(239, 243, 243, 1),
                    ),
                    child: SizedBox(
                      height: UIConverter.getComponentHeight(context, 16.67),
                      width: UIConverter.getComponentWidth(context, 16.67),
                      child: const Icon(Icons.email),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: SizedBox(
                        width: UIConverter.getComponentWidth(context, 50),
                        child: Text(
                          'Email',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: responsiveFontSize(12)),
                        ),
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
                      color: Color.fromRGBO(239, 243, 243, 1),
                    ),
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
                        style: TextStyle(fontSize: responsiveFontSize(15)),
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
                        child: Material(
                            child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Center(child: phonePopup());
                                      });
                                },
                                icon: phone))),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: SizedBox(
                        width: UIConverter.getComponentWidth(context, 50),
                        child: Text(
                          'Phone',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: responsiveFontSize(12)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
