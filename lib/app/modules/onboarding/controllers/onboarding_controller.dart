import 'package:consistly/app/core/services/auth_service.dart';
import 'package:consistly/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class OnboardingController extends GetxController {
  final goals = ["Work", "Study", "Health", "Life"];
  var goalSelectedIndex = 0.obs;
  final energies = ["High", "Balanced"];
  var energySelectedIndex = 0.obs;
  var currentPage = 0.obs;
  final PageController pageController = PageController();
  var improvements = "".obs;

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

  Future<void> finishOnboarding() async {
    await AuthService().saveOnboardingData(
      energyLevel: energies[energySelectedIndex.value],
      improvements: goals[goalSelectedIndex.value],
      goals: 'Focus better at ${goals[goalSelectedIndex.value]}',
    );

    // pindah ke Home
    SpUtil.putBool('isOnboarded', true);
    Get.offAllNamed(Routes.HOME);
  }
}
