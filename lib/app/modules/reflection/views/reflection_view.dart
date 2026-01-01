import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reflection_controller.dart';

class ReflectionView extends GetView<ReflectionController> {
  const ReflectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReflectionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReflectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
