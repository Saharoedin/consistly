import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/focus_controller.dart';

class FocusView extends GetView<FocusController> {
  const FocusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FocusView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FocusView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
