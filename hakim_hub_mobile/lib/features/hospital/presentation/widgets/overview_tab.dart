import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/features/core/splash_screen.dart';
import 'package:hakim_hub_mobile/features/hospital/data/models/hospital_address.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_card.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_google_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/ui_converter.dart';
import 'Exanded_text.dart';
import 'app_constans.dart';
import 'map_box.dart';
import 'package:expandable_text/expandable_text.dart';

class OverviewTab extends StatefulWidget {
  final InstitutionDetailDomain institutionDetailDomain;

  OverviewTab({Key? key, required this.institutionDetailDomain})
      : super(key: key);

  @override
  _OverviewTabState createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  int _selectedIndex = -1;
  bool _isExpanded = false;
  AddressModel address = AddressModel(
    country: "USA",
    region: "California",
    zone: "Western",
    woreda: "San Mateo",
    city: "San Francisco",
    subCity: "Mission District",
    longitude: -122.4194,
    latitude: 37.7749,
    summary: "123 Mission St, San Francisco, CA 94105",
    id: "abc123",
  );

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: UIConverter.getComponentWidth(context, 30),
          right: UIConverter.getComponentWidth(context, 30),
          top: UIConverter.getComponentHeight(context, 25),
          bottom: UIConverter.getComponentHeight(context, 25)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: UIConverter.getComponentHeight(context, 340),
              width: UIConverter.getComponentWidth(context, 382),
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: UIConverter.getComponentHeight(context, 254),
                    width: UIConverter.getComponentWidth(context, 382),
                    child: Image.asset(
                      'assets/images/black_lion.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: UIConverter.getComponentHeight(context, 214),
                  left: UIConverter.getComponentWidth(context, 30),
                  right: UIConverter.getComponentWidth(context, 30),
                  child: HospitalCard(),
                ),
              ]),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hospital Description',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: UIConverter.getComponentHeight(context, 16)),
            Text(
              widget.institutionDetailDomain.summary,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            ExpandableText(
              widget.institutionDetailDomain.summary,
              maxLines: 3,
              expanded: _isExpanded,
              style: const TextStyle(fontSize: 15),
              expandText: 'See More',
              collapseText: 'See Less',
              linkColor: Colors.blue,
              onExpandedChanged: (value) {
                setState(() {
                  _isExpanded = value;
                });
              },
            ),
            SizedBox(height: UIConverter.getComponentHeight(context, 30)),
            Container(width: 400, height: 400, child: MapBoxWidget()),
            SizedBox(height: UIConverter.getComponentHeight(context, 50)),
            const Row(
              children: [
                Text(
                  'Services We Provide',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: UIConverter.getComponentHeight(context, 15)),
            SizedBox(
              height: 200,
              width: UIConverter.getComponentWidth(context, 382),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: widget.institutionDetailDomain.services.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: UIConverter.getComponentHeight(context, 30),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.07),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: UIConverter.getComponentHeight(context, 50)),
            Row(
              children: [
                clock,
                SizedBox(width: UIConverter.getComponentWidth(context, 10)),
                const Text(
                  "Available 24 hrs  5 days a week",
                  style: TextStyle(fontSize: 15, color: titleTextColor),
                ),
              ],
            ),
            SizedBox(height: UIConverter.getComponentHeight(context, 20)),
            Row(
              children: [
                location,
                SizedBox(width: UIConverter.getComponentWidth(context, 10)),
                SizedBox(
                  width: UIConverter.getComponentWidth(context, 300),
                  child: Text(widget.institutionDetailDomain.address.summary,
                      maxLines: 2,
                      style:
                          const TextStyle(fontSize: 15, color: titleTextColor)),
                ),
              ],
            ),
            Row(
              children: [
                HospitalMap(
                  address: address,
                )
                // TextButton(
                //   onPressed: () {},
                //   child: const Text("SEE IT ON MAP"),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
