import 'package:flutter/material.dart';


class TOCHeader extends CustomPainter{

  final Color shapeColor; // Add this line

  TOCHeader({required this.shapeColor}); // Add this constructor

  @override
  void paint(Canvas canvas, Size size) {

    // Shape
    Paint paint_fill_0 = Paint()
      ..color =  shapeColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width,0);
    path_0.lineTo(0,0);
    path_0.quadraticBezierTo(size.width*-0.0034250,size.height*0.5020857,size.width*0.1666667,size.height*0.5002857);
    path_0.cubicTo(size.width*0.3343750,size.height*0.5023571,size.width*0.6697917,size.height*0.5065000,size.width*0.8375000,size.height*0.5085714);
    path_0.quadraticBezierTo(size.width*0.9491083,size.height*0.5069429,size.width*1.0004167,size.height*1.0014286);
    path_0.lineTo(size.width,0);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


    // Shape

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(0, 255, 255, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


