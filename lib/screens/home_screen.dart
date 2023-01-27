import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:getx_trainer_app/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var headstyle = Theme.of(context).textTheme.headlineLarge;
    var subheadstyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              children: [
                Text(
                  'Training',
                  style: headstyle!.copyWith(color: AppColor.homePageTitle),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.homePageIcons,
                ),
                const Gap(10),
                Icon(
                  Icons.calendar_today_rounded,
                  color: AppColor.homePageIcons,
                ),
                const Gap(10),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.homePageIcons,
                ),
              ],
            ),
            const Gap(20),
            Row(
              children: [
                Text(
                  'Your program',
                  style:
                      subheadstyle!.copyWith(color: AppColor.homePageSubtitle),
                ),
                const Spacer(),
                Text(
                  'Detail',
                  style: subheadstyle.copyWith(color: AppColor.homePageDetail),
                ),
                const Gap(10),
                Icon(
                  Icons.arrow_forward,
                  color: AppColor.homePageIcons,
                ),
              ],
            ),
            const Gap(10),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.gradientFirst.withOpacity(0.8),
                      AppColor.gradientSecond.withOpacity(0.9),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(80),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10))),
            ),
          ]),
        ),
      ),
    );
  }
}
