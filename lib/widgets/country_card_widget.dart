import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/constants/text_constants.dart';

class CountryCardWidget extends StatelessWidget {
  final DateTime currentTime;
  final String location;
  final int hourDifference;

  const CountryCardWidget({
    super.key,
    required this.currentTime,
    required this.location,
    required this.hourDifference,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            location,
            style: const TextStyle(
              fontFamily: quicksandRegular,
              fontSize: 20,
            ),
          ),
          Text(
            '${(currentTime.hour + hourDifference).toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontFamily: quicksandLight,
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}
