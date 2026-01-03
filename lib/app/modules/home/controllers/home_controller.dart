import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return "Hi, Good Morning";
    } else if (hour < 18) {
      return "Hi, Good Afternoon";
    } else {
      return "Hi, Good Evening";
    }
  }
}
