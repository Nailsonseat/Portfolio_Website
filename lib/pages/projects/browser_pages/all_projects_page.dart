import 'package:flutter/material.dart';
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
    return Consumer<ProjectPageProvider>(
      builder: (_, projectProvider, __) {
        return Opacity(
          opacity: projectProvider.opacity, // Adjust the opacity value to control the level of fading
          child: SizedBox.expand(
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.spaceEvenly,
              runSpacing: 80,
              children: [
                for (Project i in projectProvider.projects)
                  SizedBox(
                    width: 500,
                    height: 650,
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
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                i.title,
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              i.briefDescription,
                              style: GoogleFonts.robotoMono(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Read more",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () => _redirectTo(i.source),
                                  child: const Text(
                                    "Source",
                                    style: TextStyle(fontSize: 20),
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
