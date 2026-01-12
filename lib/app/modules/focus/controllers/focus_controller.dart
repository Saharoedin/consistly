import 'dart:async';

import 'package:consistly/app/data/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FocusController extends GetxController with WidgetsBindingObserver {
  late Task task;
  final durationMinutes = 25;
  final remainingSeconds = 0.obs;
  final isRunning = false.obs;

  DateTime? startTime;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);

    task = Get.arguments as Task;
    remainingSeconds.value = durationMinutes * 60;
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.onClose();
  }

  void startFocus() {
    if (isRunning.value) return;

    startTime = DateTime.now();
    isRunning.value = true;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _tick(),
    );
  }

  void _tick() {
    final elapsed = DateTime.now().difference(startTime!).inSeconds;

    final remaining = (durationMinutes * 60) - elapsed;

    if (remaining <= 0) {
      completeFocus();
    } else {
      remainingSeconds.value = remaining;
    }
  }

  void completeFocus() {
    _timer?.cancel();
    isRunning.value = false;
    remainingSeconds.value = 0;

    // tandai task selesai
    markTaskCompleted();

    // simpan session (nanti Firebase)
    Get.back();
  }

  void markTaskCompleted() {
    // nanti update ke Firestore
    // completed = true
  }
}
