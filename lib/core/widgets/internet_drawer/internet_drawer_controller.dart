import 'package:get/get.dart';

class InternetDrawerController {
  var enableInternet = false.obs;

  void changeInternetConnection(bool value) {
    enableInternet.value = value;
  }
}
