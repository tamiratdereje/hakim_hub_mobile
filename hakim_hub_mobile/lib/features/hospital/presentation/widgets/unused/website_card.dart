import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';
import 'package:url_launcher/url_launcher.dart';
import '../innercard2.dart';
class WebsiteCard extends StatelessWidget {
  final InstitutionDetailDomain institutionDetail;

  const WebsiteCard({required this.institutionDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebsiteCardBody(institutionDetail: institutionDetail),
    );
  }
}

class WebsiteCardBody extends StatelessWidget {
  final InstitutionDetailDomain institutionDetail;

  const WebsiteCardBody({required this.institutionDetail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
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
                "website",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10),
            buildinnercardWeb(
              imagePath: "assets/images/website_icon.png",
              text: TextButton(
                onPressed: ()  async {
                  if (await canLaunch(institutionDetail.website)) {
                    await launch(institutionDetail.website);
                  } else {
                    throw 'Could not launch ${institutionDetail.website}';
                  }
                },child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    institutionDetail.institutionName,
                    textAlign: TextAlign.left,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.black,
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