import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PageOneBackgroundMobile extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(
        Offset(size.width * 0.50, 0),
        Offset(size.width * 0.50, size.height * 1.00),
        [const Color(0xff54e8c5), const Color(0xff46ff1d), const Color(0xff54e8c5), const Color(0xff33ffff)],
        [0.00, 0.25, 0.55, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0021978, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 1.0010730);
    path_0.lineTo(size.width * -0.0021978, size.height * 1.0010730);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
