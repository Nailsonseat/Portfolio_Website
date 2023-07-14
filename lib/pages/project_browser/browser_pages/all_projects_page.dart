import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    width = width < 800 ? 800 : width;

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
                for (Project i in projectProvider.projects)
                  SizedBox(
                    width: width / 3.948,
                    height: width / 3.03692,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                            child: i.image,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton(
                                  onPressed: () => context.go(i.pagePath),
                                  style: OutlinedButton.styleFrom(fixedSize: Size(width / 11, width / 56.4)),
                                  child: Text(
                                    "Read more",
                                    style: TextStyle(fontSize: width / 98.7),
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () => _redirectTo(i.source),
                                  style: OutlinedButton.styleFrom(fixedSize: Size(width / 11, width / 56.4)),
                                  child: Text(
                                    "Source",
                                    style: TextStyle(fontSize: width / 98.7),
                                  ),
                                ),
                              ],
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
