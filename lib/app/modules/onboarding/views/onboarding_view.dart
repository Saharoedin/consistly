import 'package:consistly/app/core/utils/constants.dart';
import 'package:consistly/app/core/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => IntroductionScreen(
            globalBackgroundColor: Theme.of(context).colorScheme.background,
            pages: [
              PageViewModel(
                decoration: PageDecoration(
                  titleTextStyle: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary),
                  bodyTextStyle: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                title: "Consistly",
                bodyWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/ic-onboarding11.png',
                        // height: 175.0,
                      ),
                      SizedBox(height: padding),
                      Text(
                        "Build consistency, one day at a time.",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).colorScheme.secondary),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),
              PageViewModel(
                title: "What do you want\nto improve?",
                decoration: PageDecoration(
                  titleTextStyle: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary),
                  bodyTextStyle: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                bodyWidget: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: padding,
                      crossAxisSpacing: padding),
                  itemCount: controller.goals.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var goal = controller.goals[index];

                    return GestureDetector(
                      onTap: () {
                        controller.goalSelectedIndex.value = index;
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
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              PageViewModel(
                title: "How's your energy\nmost days?",
                decoration: PageDecoration(
                  titleTextStyle: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary),
                  bodyTextStyle: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                bodyWidget: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: padding,
                      crossAxisSpacing: padding),
                  itemCount: controller.energies.length,
                  shrinkWrap: true,
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
                            color: controller.energySelectedIndex.value == index
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.1)
                                : Theme.of(context).colorScheme.background,
                            border: Border.all(
                                color: controller.energySelectedIndex.value ==
                                        index
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary,
                                width: controller.energySelectedIndex.value ==
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
              PageViewModel(
                title: "What do you want\nto achieve?",
                decoration: PageDecoration(
                  titleTextStyle: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary),
                  bodyTextStyle: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                bodyWidget: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PrimaryButton(
                          text:
                              'Focus better at ${controller.goals[controller.goalSelectedIndex.value]}',
                          onTap: () {}),
                      SizedBox(height: padding),
                      PrimaryButton(
                          text: 'Generate Plan ⭐',
                          onTap: () {
                            controller.currentPage.value = 4;
                          }),
                    ],
                  ),
                ),
              ),
              PageViewModel(
                title: "Generating your plan...",
                decoration: PageDecoration(
                  titleTextStyle: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary),
                  bodyTextStyle: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ic-onboarding331.png',
                      // height: 175.0,
                    ),
                    SizedBox(height: padding),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.circle_filled,
                          color: Theme.of(context).colorScheme.primary,
                          size: 8,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Breakdown goals -> small step',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.circle_filled,
                          color: Theme.of(context).colorScheme.primary,
                          size: 8,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Anti-overwhelm',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.circle_filled,
                          color: Theme.of(context).colorScheme.primary,
                          size: 8,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Personalized',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
            showSkipButton: false,
            showNextButton: false,
            showDoneButton: false,
            allowImplicitScrolling: true,
            controlsPadding: EdgeInsets.all(padding),
            globalFooter: controller.currentPage.value == 1 &&
                    controller.currentPage.value == 3
                ? null
                : Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Obx(() => PrimaryButton(
                          text: controller.currentPage.value == 0
                              ? 'Get Started'
                              : controller.currentPage.value == 1
                                  ? 'Next'
                                  : 'Continue',
                          onTap: () {
                            controller.currentPage.value = 1;
                          },
                        )),
                  ),
            // freeze: true,
            onChange: (value) {
              controller.currentPage.value = value;
            },
            infiniteAutoScroll: false,
            initialPage: controller.currentPage.value,
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Theme.of(context).colorScheme.primary,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}
