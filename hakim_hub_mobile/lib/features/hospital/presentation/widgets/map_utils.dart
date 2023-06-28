import 'package:url_launcher/url_launcher.dart';

Future<void> openMap({
  required latitude,
  required longitude,
}) async {
  final String googleMapsUrl =
      "https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}";
  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  } else {
    throw 'Could not launch $googleMapsUrl';
  }
}
