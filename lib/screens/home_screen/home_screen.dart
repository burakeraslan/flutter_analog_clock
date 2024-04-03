import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/constants/text_constants.dart';
import 'package:flutter_analog_clock/constants/theme_constants.dart';
import 'package:flutter_analog_clock/controller/home_controller/home_controller.dart';
import 'package:flutter_analog_clock/screens/home_screen/painter/clock_painter.dart';
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
                        '${controller.time.hour}:${controller.time.minute}',
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
                ],
              ),
            );
          }),
    );
  }
}
