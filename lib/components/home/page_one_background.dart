import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PageOneBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 2

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 235, 220, 71)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(
        Offset(size.width * 0.37, size.height * -0.00),
        Offset(size.width * 0.75, size.height * 1.00),
        const [Color(0xffefd16c), Color(0xffea7272), Color(0xfff03636)],
        [0.00, 0.50, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7441667, size.height * 0.8385714);
    path_0.quadraticBezierTo(size.width * 0.6231250, size.height * -0.0007143, 0, size.height * 0.0014286);
    path_0.quadraticBezierTo(
        size.width * 0.0002083, size.height * 0.1796429, size.width * 0.0008333, size.height * 1.0014286);
    path_0.lineTo(size.width * 0.7466667, size.height * 0.9900000);
    path_0.lineTo(size.width * 0.7441667, size.height * 0.8385714);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 13, 173, 167)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill1.shader = ui.Gradient.linear(
        Offset(size.width * -0.00, size.height * 0.50),
        Offset(size.width, size.height * 0.50),
        const [Color(0xff83978d), Color(0xff7f72ea), Color(0xff3ad8ba)],
        [0.00, 0.50, 1.00]);

    Path path_1 = Path();
    path_1.moveTo(size.width, 0);
    path_1.quadraticBezierTo(size.width * 0.6368750, size.height * 0.9985714, size.width * -0.0008333, size.height);
    path_1.quadraticBezierTo(size.width * 0.2493750, size.height * 0.9996429, size.width, size.height * 0.9985714);
    path_1.lineTo(size.width, 0);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
