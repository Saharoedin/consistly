import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final todayFocus = ''.obs;

  final tasks = <String>[
    "Read 10 pages" 'Work deeply for 45 minutes without distractions',
    'Finish one important task you’ve been avoiding',
    'Focus on quality, not quantity, today',
    'Make progress, not perfection',
  ].obs;

  @override
  void onInit() {
    super.onInit();
    generateTodayFocus();
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

  Future<void> generateTodayFocus() async {
    EasyLoading.show(status: 'Loading...');

    // ⏳ simulasi AI delay
    await Future.delayed(const Duration(seconds: 1));

    // 🤖 AI PLACEHOLDER
    todayFocus.value = _fakeAIFocus();

    EasyLoading.dismiss();
  }

  String _fakeAIFocus() {
    final focuses = [
      'Work deeply for 45 minutes without distractions',
      'Finish one important task you’ve been avoiding',
      'Focus on quality, not quantity, today',
      'Make progress, not perfection',
    ];
    focuses.shuffle();
    return focuses.first;
  }
}
