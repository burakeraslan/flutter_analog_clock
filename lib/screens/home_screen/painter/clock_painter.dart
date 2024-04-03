import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final DateTime currentTime;
  final double radius;

  ClockPainter(this.currentTime, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final dotRadius = radius * 0.1;

    // Circle
    final circlePaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radius, circlePaint);

    // Dot
    final dotPaint = Paint()..color = Colors.grey.withOpacity(0.5);
    canvas.drawCircle(center, dotRadius, dotPaint);

    // Second Line
    final angle = (currentTime.second * 6 * pi / 180) - pi / 2;
    final startPoint = Offset(
      center.dx + dotRadius * cos(angle),
      center.dy + dotRadius * sin(angle),
    );

    final length = radius * 0.8;
    final endPoint = Offset(
      center.dx + length * cos(angle),
      center.dy + length * sin(angle),
    );

    final secondLinePaint = Paint()
      ..color = Colors.pink
      ..strokeWidth = 3;

    canvas.drawLine(
      startPoint,
      endPoint,
      secondLinePaint,
    );

    // Minute Line
    final minuteAngle = (currentTime.minute * 6 * pi / 180) - pi / 2;
    final minuteStartPoint = Offset(
      center.dx + dotRadius * cos(minuteAngle),
      center.dy + dotRadius * sin(minuteAngle),
    );

    final minuteLength = radius * 0.7;
    final minuteEndPoint = Offset(
      center.dx + minuteLength * cos(minuteAngle),
      center.dy + minuteLength * sin(minuteAngle),
    );

    final minuteLinePaint = Paint()
      ..color = Colors.blue.shade200
      ..strokeWidth = 7;

    canvas.drawLine(
      minuteStartPoint,
      minuteEndPoint,
      minuteLinePaint,
    );

    // Hour Line
    final hourAngle = (currentTime.hour * 30 * pi / 180) - pi / 2;
    final hourStartPoint = Offset(
      center.dx + dotRadius * cos(hourAngle),
      center.dy + dotRadius * sin(hourAngle),
    );

    final hourLength = radius * 0.6;
    final hourEndPoint = Offset(
      center.dx + hourLength * cos(hourAngle),
      center.dy + hourLength * sin(hourAngle),
    );

    final hourLinePaint = Paint()
      ..color = Colors.blue.shade100
      ..strokeWidth = 7;

    canvas.drawLine(
      hourStartPoint,
      hourEndPoint,
      hourLinePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
