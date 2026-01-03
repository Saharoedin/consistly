import 'dart:io';

import 'package:consistly/app/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/insight_controller.dart';

class InsightView extends GetView<InsightController> {
  const InsightView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Insight'),
        centerTitle: Platform.isIOS ? true : false,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(padding),
        color: Theme.of(context).colorScheme.background,
        child: ListView(
          shrinkWrap: true,
          controller: ScrollController(),
          children: [
            Text(
              'Consistentcy : 82%',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Best Day : Thursday',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 16),
            Divider(
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(padding),
              width: Get.width,
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                ),
              ),
              child: Text(
                'Great job! Keep up the steady pace next week!',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
