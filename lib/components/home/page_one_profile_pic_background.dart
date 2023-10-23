import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ProfilePictureBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill1.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.50),
        Offset(size.width * 1.00, size.height * 0.50),
        const [Color(0xffd6ae5d), Color(0xffffffff), Color(0xffcbcbcb), Color(0xffffffff), Color(0xff41cdd6)],
        [0.00, 0.53, 0.73, 0.90, 1.00]);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * -0.0000000);
    path_1.lineTo(size.width * 1, size.height * 0);
    path_1.lineTo(size.width * 1, size.height * 1);
    path_1.lineTo(0, size.height * 1);
    path_1.lineTo(0, size.height * 0);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
