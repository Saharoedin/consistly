import 'dart:io';

import 'package:consistly/app/core/utils/constants.dart';
import 'package:consistly/app/core/widgets/primary_button.dart';
import 'package:consistly/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left,
              color: Theme.of(context).colorScheme.primary, size: 40),
          onPressed: () {
            Get.offAndToNamed(Routes.ONBOARDING);
          },
        ),
        title: Text(controller.getGreeting()),
        centerTitle: Platform.isIOS ? true : false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s focus',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: padding),
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          )),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0,
                              color: Theme.of(context).colorScheme.background,
                              child: ListTile(
                                shape: Border(
                                    bottom: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.2),
                                )),
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(
                                  CupertinoIcons.square,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                title: Text(
                                  'Focus ${index + 1}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            PrimaryButton(
              text: 'Start Focus',
              fontColor: Theme.of(context).colorScheme.onPrimary,
              onTap: () {
                Get.toNamed(Routes.FOCUS);
              },
            ),
            SizedBox(height: padding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.circle_fill,
                ),
                SizedBox(width: 8),
                Text('Energy : Normal'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
