import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/phone_card.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/website_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'email_card.dart';
import 'map_utils.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';

class HospitalCard extends StatefulWidget {
  final double width = 380;
  final double height = 106;
  final double initialSize = 74;
  final double latitude;
  final double longitude;
  final InstitutionDetailDomain institutionDetailDomain;
  const HospitalCard({
    Key? key,
    required this.institutionDetailDomain,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  _HospitalCardState createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // body: Center(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        height: UIConverter.getComponentHeight(context, widget.height),
        width: UIConverter.getComponentWidth(context, widget.width),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height:
                  UIConverter.getComponentHeight(context, widget.initialSize),
              width: UIConverter.getComponentWidth(context, widget.initialSize),
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
                              return Center(
                                child: websiteCard(),
                              );
                            },
                          );
                        },
                        icon: Icon(MdiIcons.web),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: UIConverter.getComponentWidth(context, 60),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Website',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:
                                UIConverter.getComponentHeight(context, 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:
                  UIConverter.getComponentHeight(context, widget.initialSize),
              width: UIConverter.getComponentWidth(context, widget.initialSize),
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
                        icon: email,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: popup_email(),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: UIConverter.getComponentWidth(context, 50),
                        child: Text(
                          'Email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:
                                UIConverter.getComponentHeight(context, 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:
                  UIConverter.getComponentHeight(context, widget.initialSize),
              width: UIConverter.getComponentWidth(context, widget.initialSize),
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
                        icon: Icon(Icons.directions),
                        onPressed: () {
                          openMap(
                            longitude: widget
                                .institutionDetailDomain.address.longitude,
                            latitude:
                                widget.institutionDetailDomain.address.latitude,
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: UIConverter.getComponentWidth(context, 70),
                        child: Text(
                          'Directions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:
                                UIConverter.getComponentHeight(context, 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:
                  UIConverter.getComponentHeight(context, widget.initialSize),
              width: UIConverter.getComponentWidth(context, widget.initialSize),
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
                        icon: phone,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: phonePopup(),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: UIConverter.getComponentWidth(context, 50),
                        child: Text(
                          'Phone',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:
                                UIConverter.getComponentHeight(context, 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
