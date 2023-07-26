import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/cards/innercard2.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Inner_card.dart';

class PhoneCard extends StatelessWidget {
  final InstitutionDetailDomain institutionDetail;

  const PhoneCard({required this.institutionDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: phonePopup(institutionDetail: institutionDetail),
    );
  }
}

class phonePopup extends StatelessWidget {
  final InstitutionDetailDomain institutionDetail;

  const phonePopup({required this.institutionDetail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 240, 239, 239),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 4, top: 15),
              child: Text(
                "Contact",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 4, top: 0),
              child: Text(
                "Reception",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                ),
              ),
            ),
            SizedBox(height: 10),
            buildinnercardWeb(
              imagePath: "assets/images/phone-call_icon.png",
              text: TextButton(
                onPressed: () async {
                  final phoneUrl = 'tel:${institutionDetail.phoneNumber}';
                  if (await canLaunch(phoneUrl)) {
                    await launch(phoneUrl);
                  } else {
                    throw 'Could not launch ${institutionDetail.phoneNumber}';
                  }
                },
               child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    institutionDetail.phoneNumber,
                    textAlign: TextAlign.left,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  // padding: EdgeInsets.zero,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
