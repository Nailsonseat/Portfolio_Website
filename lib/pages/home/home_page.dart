import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_website/components/home/page_one_background.dart';
import 'package:portfolio_website/providers/scroll_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/home/page_one_button_gradient.dart';
import '../../components/home/page_one_profile_pic_background.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    width = width < 800 ? 800 : width;
    ScrollTopProvider scrollProvider = Provider.of<ScrollTopProvider>(context, listen: false);

    return Container(
      height: height - scrollProvider.appBarHeight,
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[BoxShadow(color: Colors.black54, blurRadius: 20.0, offset: Offset(0.0, 0.75))],
      ),
      child: Stack(
        children: [
          CustomPaint(
            size: Size(width, height - scrollProvider.appBarHeight),
            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: ProfilePictureBackground(),
          ),
          CustomPaint(
            size: Size(width, height - scrollProvider.appBarHeight),
            // You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: PageOneBackground(),
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
            child: ClipOval(
              child: SizedBox(
                width: width / 6.16875 < 160 ? 160 : width / 6.16875,
                height: width / 6.16875 < 160 ? 160 : width / 6.16875,
                child: Image.asset('lib/assets/images/profile_pic/profile_pic.png'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 150, left: width / 5.64),
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
                    fontSize: width / 28.2,
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
                  style: GoogleFonts.merriweatherSans(
                      fontSize: width / 98.7 < 15 ? 15 : width / 98.7, color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: width / 24.675,
                  width: width / 3.163461,
                  decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () => _redirectMyGithub(),
                        icon: Icon(LineIcons.github, color: Colors.grey[700]),
                        iconSize: width / 43.866666666,
                      ),
                      IconButton(
                        onPressed: () => _redirectMyLinkedIn(),
                        icon: const Icon(LineIcons.linkedin),
                        iconSize: width / 43.866666666,
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
                        iconSize: width / 43.866666666,
                        color: Colors.redAccent,
                      ),
                      IconButton(
                        onPressed: () => _redirectMyDiscord(),
                        icon: const Icon(LineIcons.discord),
                        iconSize: width / 43.866666666,
                        color: Colors.indigoAccent,
                      ),
                      IconButton(
                        onPressed: () => _redirectMyWhatsapp(),
                        icon: const Icon(LineIcons.whatSApp),
                        iconSize: width / 43.866666666,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: width / 9.87,
                  height: width / 39.48 < 15 ? 15 : width / 39.48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.transparent, // Set the background color to transparent
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
                        borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                        child: CustomPaint(
                          size: Size(width, (width * 1).toDouble()),
                          painter: ButtonGradient(),
                        ), // Your custom paint widget
                      ), // Your custom paint widget
                      SizedBox(
                        width: width / 9.87,
                        height: width / 39.48 < 15 ? 15 : width / 39.48,
                        child: TextButton(
                          onPressed: () =>
                              Provider.of<ScrollTopProvider>(context, listen: false).scrollToProjects(height),
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
                            style: TextStyle(fontSize: width / 98.7 < 13 ? 13 : width / 98.7, color: Colors.grey[100]),
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
    );
  }
}
