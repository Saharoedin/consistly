import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final goals = ["Work", "Study", "Health", "Life"];
  var goalSelectedIndex = 0.obs;
  final energies = ["High", "Balanced"];
  var energySelectedIndex = 0.obs;
  var currentPage = 0.obs;

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
}
