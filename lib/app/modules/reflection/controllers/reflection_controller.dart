import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReflectionController extends GetxController {
  var selectedMode = ''.obs;
  var selectedFeeling = ''.obs;

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

  void setMode(String mood) {
    if (selectedMode.value == mood) {
      selectedMode.value = '';
    } else {
      selectedMode.value = mood;
    }
  }

  void setFeeling(String feeling) {
    if (selectedFeeling.value == feeling) {
      selectedFeeling.value = '';
    } else {
      selectedFeeling.value = feeling;
    }
  }
}
