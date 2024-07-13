import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ButtonGradientTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // Layer 1
    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(Offset(size.width * -0.00, size.height * 0.50),
        Offset(size.width, size.height * 0.50), [const Color(0xffff0000), const Color(0xffffa600)], [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0016667, size.height * 0.9971429);
    path_0.lineTo(size.width * -0.0008333, size.height * -0.0028571);
    path_0.lineTo(size.width, size.height * -0.0014286);
    path_0.lineTo(size.width, size.height * 0.9985714);

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
