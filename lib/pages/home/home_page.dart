import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_website/components/home/page_one_background.dart';
import 'package:portfolio_website/components/home/page_one_background_mobile.dart';
import 'package:portfolio_website/providers/scroll_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../chatbot/chatbot.dart';
import '../../components/home/page_one_button_gradient.dart';
import '../../components/home/page_one_profile_pic_background.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class HomeLandingPage extends StatelessWidget {
  const HomeLandingPage({super.key});

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

  void _redirectMySlack() async {
    String body = 'https://slack.com/app_redirect?channel=';
    String chanelId = 'D01DN9HBGLV';
    String link = body + chanelId;
    try {
      if (!await launchUrl(Uri.parse(link))) {
        throw ('Error launching url');
      }
    } catch (error) {
      Logger().e(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = 1978;
    double height =  MediaQuery.of(context).size.height;

    final tooltipController = JustTheController();

    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;

    Future.delayed(const Duration(milliseconds: 1000), () {
      if(!isLengthGreaterThanWidth) {
        tooltipController.showTooltip(immediately: false);
      }
    });

    if (isLengthGreaterThanWidth) {
      width = 455;
    }

    ScrollProvider scrollProvider = Provider.of<ScrollProvider>(context, listen: false);

    return Container(
      height: height,
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[BoxShadow(color: Colors.black54, blurRadius: 20.0, offset: Offset(0.0, 0.75))],
      ),
      child: Stack(
        children: [
          if (!isLengthGreaterThanWidth) ...[
            CustomPaint(
              size: Size(width, height),
              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: ProfilePictureBackground(),
            ),
            CustomPaint(
              size: Size(width, height),
              // You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: PageOneBackground(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 1260, top: 180),
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
              child: ClipOval(
                child: SizedBox(
                  width: 280,
                  height: 280,
                  child: Image.asset('lib/assets/images/profile_pic/profile_pic.png'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 250, left: 350),
              width: 624,
              height: 822,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi,\nI am Aadarsh',
                    style: GoogleFonts.comfortaa(
                      color: Colors.white,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      fontSize: 70,
                      shadows: [
                        const Shadow(
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
                    margin: const EdgeInsets.only(top: 20),
                    height: 80,
                    width: 625,
                    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(40)),
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
                          icon: const Icon(LineIcons.linkedin),
                          iconSize: 45,
                          color: Colors.lightBlueAccent,
                        ),
                        IconButton(
                          onPressed: () => _redirectMySlack(),
                          icon: SizedBox(
                            width: 55,
                            height: 55,
                            child: Image.asset('lib/assets/icons/slack.png'),
                          ),
                          color: Colors.lightBlueAccent,
                        ),
                        IconButton(
                          onPressed: () => _sendMeMail(),
                          icon: const Icon(LineIcons.envelope),
                          iconSize: 45,
                          color: Colors.redAccent,
                        ),
                        IconButton(
                          onPressed: () => _redirectMyDiscord(),
                          icon: const Icon(LineIcons.discord),
                          iconSize: 45,
                          color: Colors.indigoAccent,
                        ),
                        IconButton(
                          onPressed: () => _redirectMyWhatsapp(),
                          icon: const Icon(LineIcons.whatSApp),
                          iconSize: 45,
                          color: Colors.green,
                        ),
                        JustTheTooltip(
                          controller: tooltipController,
                          barrierDismissible: false,
                          content: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Chat with Aadarsh AI (Alpha)',
                            ),
                          ),
                          child: IconButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ChatGPTDialog();
                              },
                            ),
                            icon: SizedBox(
                              width: 55,
                              height: 55,
                              child: Image.asset('lib/assets/icons/chatbot.png'),
                            ),
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.transparent,
                      // Set the background color to transparent
                      boxShadow: const [
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
                          borderRadius: BorderRadius.circular(10.0),
                          // Adjust the border radius as needed
                          child: CustomPaint(
                            size: Size(width, (width * 1).toDouble()),
                            painter: ButtonGradient(),
                          ), // Your custom paint widget
                        ), // Your custom paint widget
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: TextButton(
                            onPressed: () =>
                                Provider.of<ScrollProvider>(context, listen: false).scrollToProjects(scrollProvider.scrollKeyHomePage),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "See My Work",
                              style: TextStyle(fontSize: 20, color: Colors.grey[100]),
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
          if (isLengthGreaterThanWidth) ...[
            CustomPaint(
              size: Size(width, height),
              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: PageOneBackgroundMobile(),
            ),
            SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.grey[200],
                      child: ClipOval(
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset('lib/assets/images/profile_pic/profile_pic.png'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Aadarsh Verma',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                      color: Colors.white,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      fontSize: 20,
                      shadows: [
                        const Shadow(
                          offset: Offset(-1, 1), // Specify the shadow offset
                          color: Colors.grey,
                          blurRadius: 1, // Specify the blur radius of the shadow
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'A student excited about AI and Software development',
                    style: GoogleFonts.merriweatherSans(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.transparent,
                      // Set the background color to transparent
                      boxShadow: const [
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
                          borderRadius: BorderRadius.circular(10.0),
                          // Adjust the border radius as needed
                          child: CustomPaint(
                            size: Size(width, (width * 1).toDouble()),
                            painter: ButtonGradient(),
                          ), // Your custom paint widget
                        ), // Your custom paint widget
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: TextButton(
                            onPressed: () =>
                                Provider.of<ScrollProvider>(context, listen: false).scrollToProjects(scrollProvider.scrollKeyHomePage),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "See My Work",
                              style: TextStyle(fontSize: 16, color: Colors.grey[100]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 180,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.transparent,
                      // Set the background color to transparent
                      boxShadow: const [
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
                          borderRadius: BorderRadius.circular(10.0),
                          // Adjust the border radius as needed
                          child: CustomPaint(
                            size: Size(width, (width * 1).toDouble()),
                            painter: ButtonGradient(),
                          ), // Your custom paint widget
                        ), // Your custom paint widget
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: TextButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ChatGPTDialog();
                              },
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "Chat with me (AI)",
                              style: TextStyle(fontSize: 16, color: Colors.grey[100]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ],
      ),
    );
  }
}
