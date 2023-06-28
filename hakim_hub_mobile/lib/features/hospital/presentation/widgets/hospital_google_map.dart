import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/features/hospital/data/models/hospital_address.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';

class HospitalMap extends StatelessWidget {
  final AddressModel address;

  HospitalMap({required this.address});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openMap();
      },
      child: Text(
        "SEE IT ON MAP",
        style: TextStyle(fontSize: UIConverter.getComponentHeight(context, 20)),
      ),
    );
  }

  Future<void> _openMap() async {
    final String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=${address.latitude},${address.longitude}";
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}