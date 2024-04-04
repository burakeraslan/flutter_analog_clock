import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/constants/text_constants.dart';
import 'package:flutter_analog_clock/constants/theme_constants.dart';
import 'package:flutter_analog_clock/controller/home_controller/home_controller.dart';
import 'package:flutter_analog_clock/screens/home_screen/painter/clock_painter.dart';
import 'package:flutter_analog_clock/widgets/country_card_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: lPrimaryColor,
      ),
      backgroundColor: lPrimaryColor,
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Text(
                    location,
                    style: TextStyle(
                      fontFamily: quicksandRegular,
                      fontSize: 22,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${controller.time.hour.toString().padLeft(2, '0')}:${controller.time.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontFamily: quicksandLight,
                          fontSize: 100,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 50,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: CustomPaint(
                      painter: ClockPainter(
                        controller.time,
                        150,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CountryCardWidget(
                          currentTime: controller.time,
                          location: 'New York, US',
                          hourDifference: -7,
                        ).paddingSymmetric(horizontal: 10),
                        CountryCardWidget(
                          currentTime: controller.time,
                          location: 'London, UK',
                          hourDifference: -2,
                        ).paddingSymmetric(horizontal: 10),
                        CountryCardWidget(
                          currentTime: controller.time,
                          location: 'Tokyo, JP',
                          hourDifference: 6,
                        ).paddingSymmetric(horizontal: 10),
                        CountryCardWidget(
                          currentTime: controller.time,
                          location: 'Paris, FR',
                          hourDifference: -1,
                        ).paddingSymmetric(horizontal: 10),
                      ],
                    ),
                  ).paddingSymmetric(vertical: 20),
                ],
              ),
            );
          }),
    );
  }
}
