import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ButtonGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill1.shader = ui.Gradient.linear(Offset(size.width * -0.00, size.height * 0.50),
        Offset(size.width * 1.00, size.height * 0.50), const [Color(0xffa46acf), Color(0xff3fdad0)], [0.00, 1.00]);

    Path path_1 = Path();
    path_1.moveTo(size.width * -0.0010844, size.height * 0);
    path_1.lineTo(size.width * 1.0022687, size.height * 0);
    path_1.lineTo(size.width * 1.0022687, size.height * 1);
    path_1.lineTo(size.width * -0.0010844, size.height * 1);
    path_1.lineTo(size.width * -0.0010844, size.height * 0);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);

    // Square

    Paint paintStroke1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_1, paintStroke1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
