import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/insight_controller.dart';

class InsightView extends GetView<InsightController> {
  const InsightView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InsightView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InsightView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
