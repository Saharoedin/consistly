import 'package:consistly/app/core/utils/constants.dart';
import 'package:consistly/app/core/widgets/primary_button.dart';
import 'package:consistly/app/routes/app_pages.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CupertinoOnboarding(
          controller: controller.pageController,
          backgroundColor: Theme.of(context).colorScheme.background,
          scrollPhysics: NeverScrollableScrollPhysics(),
          pages: [
            CupertinoOnboardingPage(
              title: Text('Consistly'),
              titleToBodySpacing: padding,
              bodyPadding: EdgeInsets.all(padding),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/ic-onboarding11.png',
                          // height: 175.0,
                        ),
                        Text(
                          "Build consistency, one day at a time.",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context).colorScheme.secondary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  PrimaryButton(
                    text: 'Get Started',
                    onTap: () {
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                ],
              ),
            ),
            CupertinoOnboardingPage(
              title: Text('What do you want to improve?'),
              titleToBodySpacing: padding,
              bodyPadding: EdgeInsets.all(padding),
              body: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: padding,
                    crossAxisSpacing: padding),
                itemCount: controller.goals.length,
                shrinkWrap: true,
                controller: ScrollController(),
                itemBuilder: (context, index) {
                  var goal = controller.goals[index];

                  return GestureDetector(
                    onTap: () {
                      controller.goalSelectedIndex.value = index;
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                        color: controller.goalSelectedIndex.value == index
                            ? Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1)
                            : Theme.of(context).colorScheme.background,
                        border: Border.all(
                            color: controller.goalSelectedIndex.value == index
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary,
                            width: controller.goalSelectedIndex.value == index
                                ? 2
                                : 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                              'assets/images/ic-onboarding22${index + 1}.png',
                              width: 90.0),
                          SizedBox(height: 10),
                          Text(
                            goal,
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            CupertinoOnboardingPage(
              title: Text("How's your energy\nmost days?"),
              titleToBodySpacing: padding,
              bodyPadding: EdgeInsets.all(padding),
              body: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: padding,
                          crossAxisSpacing: padding),
                      itemCount: controller.energies.length,
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemBuilder: (context, index) {
                        var energy = controller.energies[index];

                        return GestureDetector(
                          onTap: () {
                            controller.energySelectedIndex.value = index;
                          },
                          child: Obx(
                            () => Container(
                              padding: EdgeInsets.all(padding),
                              decoration: BoxDecoration(
                                color: controller.energySelectedIndex.value ==
                                        index
                                    ? Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.1)
                                    : Theme.of(context).colorScheme.background,
                                border: Border.all(
                                    color: controller
                                                .energySelectedIndex.value ==
                                            index
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                    width:
                                        controller.energySelectedIndex.value ==
                                                index
                                            ? 2
                                            : 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      'assets/images/ic-onboarding33${index + 1}.png',
                                      height: 80.0),
                                  SizedBox(height: 10),
                                  Text(
                                    energy,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  PrimaryButton(
                    text: 'Next',
                    onTap: () {
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  )
                ],
              ),
            ),
            CupertinoOnboardingPage(
              title: Text("What do you want\nto achieve?"),
              titleToBodySpacing: padding,
              bodyPadding: EdgeInsets.all(padding),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => PrimaryButton(
                      borderColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      fontColor: Theme.of(context).colorScheme.primary,
                      text:
                          'Focus better at ${controller.goals[controller.goalSelectedIndex.value]}',
                      onTap: () {})),
                  SizedBox(height: padding),
                  PrimaryButton(
                      text: 'Generate Plan ⭐',
                      fontColor: Theme.of(context).colorScheme.onPrimary,
                      onTap: () {
                        controller.currentPage.value = 4;
                        controller.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }),
                ],
              ),
            ),
            WhatsNewPage(
              bodyPadding: EdgeInsets.symmetric(horizontal: padding),
              title: Text("Generating your plan..."),
              titleToBodySpacing: padding,
              features: [
                Row(
                  children: [
                    Image.asset('assets/images/ic-onboarding331.png',
                        width: MediaQuery.of(context).size.width * 0.8),
                  ],
                ),
                WhatsNewFeature(
                  icon: Icon(
                    CupertinoIcons.checkmark_seal_fill,
                    color: CupertinoColors.systemRed.resolveFrom(context),
                  ),
                  title: Text('Consistly'),
                  description: Text(
                    'Breakdown goals -> small step',
                  ),
                ),
                WhatsNewFeature(
                  icon: Icon(
                    CupertinoIcons.shield_fill,
                    color: CupertinoColors.systemRed.resolveFrom(context),
                  ),
                  title: Text('Stay on Track'),
                  description: Text(
                    "Anti-overwhelm",
                  ),
                ),
                WhatsNewFeature(
                  icon: Icon(
                    CupertinoIcons.star_fill,
                    color: CupertinoColors.systemRed.resolveFrom(context),
                  ),
                  title: Text('Personalized'),
                  description: Text(
                    "Personalized",
                  ),
                ),
                PrimaryButton(
                  text: 'Continue',
                  onTap: () {
                    Get.offAndToNamed(Routes.HOME);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
