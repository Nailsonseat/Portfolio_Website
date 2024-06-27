import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../all_projects.dart';
import '../../../providers/project_page_provider.dart';

class AllProjectsPage extends StatelessWidget {
  const AllProjectsPage({super.key});

  void _redirectTo(String link) async {
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
    width = width < 1200 ? 1200 : width;

    return Consumer<ProjectPageProvider>(
      builder: (_, projectProvider, __) {
        return Opacity(
          opacity: projectProvider.opacity, // Adjust the opacity value to control the level of fading
          child: SizedBox.expand(
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.spaceEvenly,
              runSpacing: width / 24.675,
              children: [
                for (Project i in projects)
                  SizedBox(
                    width: width / 3.948,
                    height: max(530, width / 2.63733333),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                            child: Image.asset(i.image),
                          ),
                          Align(
                            heightFactor: 2,
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: width / 65.8),
                              child: Text(
                                i.title,
                                style: TextStyle(fontSize: width / 65.8),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width / 65.8),
                            child: Text(
                              i.briefDescription,
                              style: GoogleFonts.robotoMono(fontSize: width / 123.375),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 65),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      style: ButtonStyle(
                                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                                          ),
                                        ),
                                        backgroundColor: WidgetStateProperty.all<Color>(i.buttonSecondaryColor),
                                        fixedSize: WidgetStateProperty.all<Size>(Size(width / 11, width / 35.4)),
                                      ),
                                      onPressed: () => context.go(i.pagePath),
                                      //  style: OutlinedButton.styleFrom(fixedSize: Size(width / 11, width / 56.4)),
                                      child: Text(
                                        "Read more",
                                        style: TextStyle(fontSize: width / 98.7, color: i.buttonPrimaryColor),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => _redirectTo(i.source),
                                      style: ButtonStyle(
                                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                                          ),
                                        ),
                                        backgroundColor: WidgetStateProperty.all<Color>(i.buttonSecondaryColor),
                                        fixedSize: WidgetStateProperty.all<Size>(Size(width / 11, width / 35.4)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            LineIcons.github,
                                            color: i.buttonPrimaryColor,
                                            size: width / 61.8125,
                                          ),
                                          Text(
                                            "Repository",
                                            style: TextStyle(fontSize: width / 98.7, color: i.buttonPrimaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
