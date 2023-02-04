import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

import 'package:getx_trainer_app/colors.dart';
import 'package:getx_trainer_app/screens/videos_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List info = [];
  _initdata() async {
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value) {
      setState(() {
        info = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initdata();
  }

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    var headstyle = texttheme.headlineLarge;
    var subheadstyle = texttheme.headline6;
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  'Training',
                  style: headstyle!.copyWith(
                      color: AppColor.homePageTitle,
                      fontWeight: FontWeight.w500),
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
                InkWell(
                  onTap: () {
                    Get.to(() => const VideosDetail());
                  },
                  child: Row(
                    children: [
                      Text(
                        'Detail',
                        style: subheadstyle.copyWith(
                            color: AppColor.homePageDetail),
                      ),
                      const Gap(10),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColor.homePageIcons,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(10),
            Container(
              padding: const EdgeInsets.all(20),
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
                    topLeft: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5, 10),
                    blurRadius: 20,
                    color: AppColor.gradientSecond.withOpacity(0.3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next Workout',
                    style: texttheme.bodyMedium!
                        .copyWith(color: AppColor.homePageContainerTextSmall),
                  ),
                  Text(
                    'Legs Toning',
                    style: texttheme.headlineMedium!
                        .copyWith(color: AppColor.homePageContainerTextSmall),
                  ),
                  Text(
                    'and Glutes Workout',
                    style: texttheme.headlineMedium!
                        .copyWith(color: AppColor.homePageContainerTextSmall),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.play_arrow,
                          color: AppColor.gradientFirst,
                        ),
                      )
                    ],
                  ),
                  Text(
                    '60 min',
                    style: texttheme.bodySmall!
                        .copyWith(color: AppColor.homePageContainerTextSmall),
                  ),
                ],
              ),
            ),
            const Gap(10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child:
                  Stack(alignment: AlignmentDirectional.bottomStart, children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.gradientSecond.withOpacity(0.4),
                        blurRadius: 40,
                      ),
                    ],
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/card.jpg'),
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: 0,
                  start: 35,
                  child: Image.asset(
                    'assets/figure.png',
                    fit: BoxFit.cover,
                  ),
                ),
                PositionedDirectional(
                  end: 50,
                  bottom: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'You are doing Great',
                        style: subheadstyle.copyWith(
                            color: AppColor.homePageDetail),
                      ),
                      const Gap(10),
                      RichText(
                        text: TextSpan(
                            text: 'Keep it up\n',
                            style: texttheme.bodyMedium!
                                .copyWith(color: AppColor.homePagePlanColor),
                            children: const [
                              TextSpan(text: 'Stick to your plan'),
                            ]),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const Gap(10),
            Text(
              'Area of Focus',
              style:
                  texttheme.headline4!.copyWith(color: AppColor.homePageTitle),
            ),
            const Gap(10),
            Container(
              width: double.infinity,
              height: 290,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GridView.builder(
                  itemCount: info.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: ((context, i) => Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.gradientSecond.withOpacity(0.3),
                                blurRadius: 10,
                              )
                            ]),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.asset('${info[i]["img"]}'),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[i]["title"],
                                style: texttheme.titleLarge!.copyWith(
                                  color: AppColor.homePageDetail,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
