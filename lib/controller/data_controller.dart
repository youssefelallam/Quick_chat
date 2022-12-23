import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DataController extends ChangeNotifier {
  String phoneNumber = '';
  openChatWhatssap() {
    try {
      launchUrl(Uri.parse('https://wa.me/$phoneNumber'),
          mode: LaunchMode.externalApplication);
    } catch (e) {
      print(e);
    }
  }
}
