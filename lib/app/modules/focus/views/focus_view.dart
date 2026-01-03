import 'dart:io';

import 'package:consistly/app/core/utils/constants.dart';
import 'package:consistly/app/core/widgets/primary_button.dart';
import 'package:consistly/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/focus_controller.dart';

class FocusView extends GetView<FocusController> {
  const FocusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Session'),
        centerTitle: Platform.isIOS ? true : false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  '23: 25:00',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: 'Pause',
                    fontColor: Theme.of(context).colorScheme.onPrimary,
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: PrimaryButton(
                    text: 'End Session',
                    fontColor: Theme.of(context).colorScheme.onPrimary,
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.REFLECTION);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
