import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logger/logger.dart';
import 'dart:ui' as ui;

import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  void _redirectMyDiscord() async {
    try {
      if (!await launchUrl(Uri.parse('https://discord.com/channels/@me/Nailsonseat#1059/'))) {
        throw ('Error launching url');
      }
    } catch (error) {
      Logger().e(error);
    }
  }

  void _redirectMyWhatsapp() async {
    String number = '919520515864';
    String message = '?text=Hi%20my%20name%20is';
    try {
      if (!await launchUrl(Uri.parse('https://wa.me/$number$message'))) {
        throw ('Error launching url');
      }
    } catch (error) {
      Logger().e(error);
    }
  }

  void _sendMeMail() async {
    String view = 'cm'; // Compose view
    String fullscreen = '1'; // Fullscreen view
    String to = 'aadarshv3@gmail.com'; // Receiver's email
    String subject = 'Enquiry%20about'; // Subject of email
    String body = 'Hi%20Aadarsh,%20'; // Body of email

    String link = 'https://mail.google.com/mail/?view=$view&fs=$fullscreen&to=$to&su=$subject&body=$body';
    try {
      if (!await launchUrl(Uri.parse(link))) {
        throw ('Error launching url');
      }
    } catch (error) {
      Logger().e(error);
    }
  }

  void _redirectMyGithub() async {
    String link = 'https://github.com/Nailsonseat';
    try {
      if (!await launchUrl(Uri.parse(link))) {
        throw ('Error launching url');
      }
    } catch (error) {
      Logger().e(error);
    }
  }

  void _redirectMyLinkedIn() async {
    String link = 'https://www.linkedin.com/in/aadarsh-verma-7b4339229/';
    try {
      if (!await launchUrl(Uri.parse(link))) {
        throw ('Error launching url');
      }
    } catch (error) {
      Logger().e(error);
    }
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    width = width < 800 ? 800 : width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        // backgroundColor: Colors.grey[300],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('Aadarsh Verma'),
      ),
      body: SizedBox(
        width: width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Colors.black54, blurRadius: 20.0, offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(width, height - 80),
                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: ProfilePictureBackground(),
                      ),
                      CustomPaint(
                        size: Size(width, height - 80),
                        // You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: BackgroundPaint(),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: width / 1.5792, top: width < 950 ? 70 : 100),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: width / 12.3375 < 80 ? 80 : width / 12.3375,
                          backgroundImage: NetworkImage('lib/assets/profile_pic.jpg'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 150, left: width / 5.64),
                        width: 524,
                        height: 822,
                        //color: Colors.lightGreenAccent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi,\nI am Aadarsh',
                              style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                textStyle: TextStyle(fontWeight: FontWeight.bold),
                                fontSize: 70,
                                shadows: [
                                  Shadow(
                                    offset: Offset(-1, 1), // Specify the shadow offset
                                    color: Colors.grey,
                                    blurRadius: 1, // Specify the blur radius of the shadow
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'A student excited about AI and Software development',
                              style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.white),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 80,
                              decoration:
                                  BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(40)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () => _redirectMyGithub(),
                                    icon: Icon(LineIcons.github, color: Colors.grey[700]),
                                    iconSize: 45,
                                  ),
                                  IconButton(
                                    onPressed: () => _redirectMyLinkedIn(),
                                    icon: Icon(LineIcons.linkedin),
                                    iconSize: 45,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  IconButton(
                                    onPressed: () => _sendMeMail(),
                                    icon: Icon(LineIcons.envelope),
                                    iconSize: 45,
                                    color: Colors.redAccent,
                                  ),
                                  IconButton(
                                    onPressed: () => _redirectMyDiscord(),
                                    icon: Icon(LineIcons.discord),
                                    iconSize: 45,
                                    color: Colors.indigoAccent,
                                  ),
                                  IconButton(
                                    onPressed: () => _redirectMyWhatsapp(),
                                    icon: Icon(LineIcons.whatSApp),
                                    iconSize: 45,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.transparent, // Set the background color to transparent
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 2),
                                    blurRadius: 4.0,
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                                    child: CustomPaint(
                                      size: Size(width, (width * 1).toDouble()),
                                      painter: ButtonGradient(),
                                    ), // Your custom paint widget
                                  ), // Your custom paint widget
                                  SizedBox(
                                    width: 200,
                                    height: 50,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "See My Work",
                                        style: TextStyle(fontSize: 20, color: Colors.grey[100]),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        elevation: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                  padding: EdgeInsets.only(top: 50),
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'About Me',
                        style: GoogleFonts.martianMono(
                          fontSize: 60,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          decorationStyle: TextDecorationStyle.double,
                          decorationThickness: 0.5,
                        ),
                      ),
                      SizedBox(height: 50,),
                      FutureBuilder(
                        future: rootBundle.loadString("lib/assets/about.txt"),
                        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data!);
                          }

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Square

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paint_fill_1.shader = ui.Gradient.linear(Offset(size.width * -0.00, size.height * 0.50),
        Offset(size.width * 1.00, size.height * 0.50), [Color(0xffa46acf), Color(0xff3fdad0)], [0.00, 1.00]);

    Path path_1 = Path();
    path_1.moveTo(size.width * -0.0010844, size.height * -0.0072142);
    path_1.lineTo(size.width * 1.0022687, size.height * -0.0072142);
    path_1.lineTo(size.width * 1.0022687, size.height * 1.0100126);
    path_1.lineTo(size.width * -0.0010844, size.height * 1.0100126);
    path_1.lineTo(size.width * -0.0010844, size.height * -0.0072142);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);

    // Square

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_1, paint_stroke_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ProfilePictureBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Square

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paint_fill_1.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.50),
        Offset(size.width * 1.00, size.height * 0.50),
        [Color(0xffd6ae5d), Color(0xffffffff), Color(0xffcbcbcb), Color(0xffffffff), Color(0xff41cdd6)],
        [0.00, 0.53, 0.73, 0.90, 1.00]);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * -0.0000000);
    path_1.lineTo(size.width * 1.0000795, size.height * -0.0000000);
    path_1.lineTo(size.width * 1.0000795, size.height * 1.0002735);
    path_1.lineTo(0, size.height * 1.0002735);
    path_1.lineTo(0, size.height * -0.0000000);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 2

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 235, 220, 71)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paint_fill_0.shader = ui.Gradient.linear(
        Offset(size.width * 0.37, size.height * -0.00),
        Offset(size.width * 0.75, size.height * 1.00),
        [Color(0xffefd16c), Color(0xffea7272), Color(0xfff03636)],
        [0.00, 0.50, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7441667, size.height * 0.8385714);
    path_0.quadraticBezierTo(size.width * 0.6231250, size.height * -0.0007143, 0, size.height * 0.0014286);
    path_0.quadraticBezierTo(
        size.width * 0.0002083, size.height * 0.1796429, size.width * 0.0008333, size.height * 1.0014286);
    path_0.lineTo(size.width * 0.7466667, size.height * 0.9900000);
    path_0.lineTo(size.width * 0.7441667, size.height * 0.8385714);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 13, 173, 167)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paint_fill_1.shader = ui.Gradient.linear(
        Offset(size.width * -0.00, size.height * 0.50),
        Offset(size.width, size.height * 0.50),
        [Color(0xff83978d), Color(0xff7f72ea), Color(0xff3ad8ba)],
        [0.00, 0.50, 1.00]);

    Path path_1 = Path();
    path_1.moveTo(size.width, 0);
    path_1.quadraticBezierTo(size.width * 0.6368750, size.height * 0.9985714, size.width * -0.0008333, size.height);
    path_1.quadraticBezierTo(size.width * 0.2493750, size.height * 0.9996429, size.width, size.height * 0.9985714);
    path_1.lineTo(size.width, 0);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
