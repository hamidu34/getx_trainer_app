import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors.dart';

class VideosDetail extends StatelessWidget {
  const VideosDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.gradientFirst.withOpacity(0.8),
              AppColor.gradientSecond.withOpacity(0.9),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.secondPageIconColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.info_outline,
                      color: AppColor.secondPageIconColor,
                    ),
                  ),
                ],
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
                children: [
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.secondPageContainerGradient1stColor,
                          AppColor.secondPageContainerGradient2ndColor,
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
