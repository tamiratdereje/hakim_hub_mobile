import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtils {
  static Future<void> launchPhoneUrl(String phoneNumber) async {
    final phoneUrl = 'tel:$phoneNumber';
    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  static Future<void> launchWebsiteUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
    
}