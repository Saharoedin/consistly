import 'dart:io';

import 'package:consistly/app/core/utils/constants.dart';
import 'package:consistly/app/core/widgets/primary_button.dart';
import 'package:consistly/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reflection_controller.dart';

class ReflectionView extends GetView<ReflectionController> {
  const ReflectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reflect on Today'),
        centerTitle: Platform.isIOS ? true : false,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: ListView(
          shrinkWrap: true,
          controller: ScrollController(),
          children: [
            Text(
              'How do you feel?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.setMode('smile');
                      },
                      child: Obx(
                        () => Container(
                          padding: EdgeInsets.all(padding),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(radius),
                            border: controller.selectedMode.value == 'smile'
                                ? Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary)
                                : Border.all(color: Colors.transparent),
                          ),
                          child: Image.asset('assets/images/ic-smile.png'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.setMode('serious');
                      },
                      child: Obx(
                        () => Container(
                          padding: EdgeInsets.all(padding),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(radius),
                            border: controller.selectedMode.value == 'serious'
                                ? Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary)
                                : Border.all(color: Colors.transparent),
                          ),
                          child: Image.asset(
                            'assets/images/ic-serious.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.setMode('sad');
                      },
                      child: Obx(
                        () => Container(
                          padding: EdgeInsets.all(padding),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(radius),
                            border: controller.selectedMode.value == 'sad'
                                ? Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary)
                                : Border.all(color: Colors.transparent),
                          ),
                          child: Image.asset('assets/images/ic-sad.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Theme.of(context).colorScheme.primary),
            SizedBox(height: 48),
            Text(
              'What blocked you?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => BlockedWidget(
                      backgroundColor:
                          controller.selectedFeeling.value == 'Too tired'
                              ? Colors.amber.shade400
                              : Theme.of(context).colorScheme.onPrimary,
                      fontColor: controller.selectedFeeling.value == 'Too tired'
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      text: 'Too tired',
                      onTap: () {
                        controller.setFeeling('Too tired');
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Obx(
                    () => BlockedWidget(
                      backgroundColor:
                          controller.selectedFeeling.value == 'Too busy'
                              ? Colors.amber.shade400
                              : Theme.of(context).colorScheme.onPrimary,
                      fontColor: controller.selectedFeeling.value == 'Too busy'
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      text: 'Too busy',
                      onTap: () {
                        controller.setFeeling('Too busy');
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Obx(
                    () => BlockedWidget(
                      backgroundColor:
                          controller.selectedFeeling.value == 'Too focus'
                              ? Colors.amber.shade400
                              : Theme.of(context).colorScheme.onPrimary,
                      fontColor: controller.selectedFeeling.value == 'Too focus'
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      text: 'Lost focus',
                      onTap: () {
                        controller.setFeeling('Too focus');
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            PrimaryButton(
              text: 'Submit',
              fontColor: Theme.of(context).colorScheme.onPrimary,
              onTap: () {
                Get.offNamed(Routes.INSIGHT);
              },
            )
          ],
        ),
      ),
    );
  }
}

class BlockedWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final Color? backgroundColor, fontColor;
  const BlockedWidget({
    super.key,
    this.text,
    this.onTap,
    this.backgroundColor,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: Center(
          child: Text('$text',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: fontColor,
              )),
        ),
      ),
    );
  }
}
