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
    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;
    width = width < 1200 ? 1200 : width;

    if (isLengthGreaterThanWidth) {
      width = 455;
    }

    return Consumer<ProjectPageProvider>(
      builder: (_, projectProvider, __) {
        return Opacity(
          opacity: projectProvider.opacity, // Adjust the opacity value to control the level of fading
          child: SizedBox.expand(
            child: isLengthGreaterThanWidth
                ? Wrap(
                    alignment: WrapAlignment.spaceAround,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 50,
                    children: [
                      for (Project i in projects)
                        Container(
                          width: 160,
                          height: 280,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                                child: Image.asset(i.image),
                              ),
                              Align(
                                heightFactor: 2,
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    i.title,
                                    maxLines: 2,
                                    style: const TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  i.briefDescription,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.robotoMono(fontSize: 11),
                                ),
                              ),
                              const Spacer(),
                              MenuAnchor(
                                style: MenuStyle(
                                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                                    ),
                                  ),
                                ),
                                builder: (context, controller, anchor) => FilledButton.tonal(
                                  onPressed: () {
                                    if (controller.isOpen) {
                                      controller.close();
                                    } else {
                                      controller.open();
                                    }
                                  },
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                                      ),
                                    ),
                                    backgroundColor: WidgetStateProperty.all<Color>(i.buttonSecondaryColor),
                                    fixedSize: WidgetStateProperty.all<Size>(const Size(130, 40)),
                                  ),
                                  child: Text(
                                    "Explore",
                                    style: TextStyle(
                                      color: i.buttonPrimaryColor,
                                    ),
                                  ),
                                ),
                                menuChildren: [
                                  MenuItemButton(
                                    onPressed: () => context.go(i.pagePath),
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all<Color>(i.buttonSecondaryColor),
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Icon(
                                            LineIcons.bookOpen,
                                            color: i.buttonPrimaryColor,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Read more",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: i.buttonPrimaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  MenuItemButton(
                                    onPressed: () => _redirectTo(i.source),
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all<Color>(i.buttonSecondaryColor),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          LineIcons.github,
                                          color: i.buttonPrimaryColor,
                                          size: 26,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "Repository",
                                          style: TextStyle(
                                            color: i.buttonPrimaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                    ],
                  )
                : Wrap(
                    alignment: WrapAlignment.spaceAround,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 80,
                    children: [
                      for (Project i in projects)
                        SizedBox(
                          width: 500,
                          height: isLengthGreaterThanWidth ? 730 : max(530, 750),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                                  child: Image.asset(i.image),
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
                                                  borderRadius:
                                                      BorderRadius.circular(10.0), // Adjust the radius as needed
                                                ),
                                              ),
                                              backgroundColor: WidgetStateProperty.all<Color>(i.buttonSecondaryColor),
                                              fixedSize: WidgetStateProperty.all<Size>(
                                                  isLengthGreaterThanWidth ? const Size(130, 50) : const Size(180, 56)),
                                            ),
                                            onPressed: () => context.go(i.pagePath),
                                            //  style: OutlinedButton.styleFrom(fixedSize: Size(width / 11, width / 56.4)),
                                            child: Text(
                                              "Read more",
                                              style: TextStyle(
                                                  fontSize: isLengthGreaterThanWidth ? 16 : 20,
                                                  color: i.buttonPrimaryColor),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () => _redirectTo(i.source),
                                            style: ButtonStyle(
                                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10.0), // Adjust the radius as needed
                                                ),
                                              ),
                                              backgroundColor: WidgetStateProperty.all<Color>(i.buttonSecondaryColor),
                                              fixedSize: WidgetStateProperty.all<Size>(
                                                  isLengthGreaterThanWidth ? const Size(130, 50) : const Size(180, 56)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  LineIcons.github,
                                                  color: i.buttonPrimaryColor,
                                                  size: isLengthGreaterThanWidth ? 26 : 32,
                                                ),
                                                Text(
                                                  "Repository",
                                                  style: TextStyle(
                                                      fontSize: isLengthGreaterThanWidth ? 16 : 20,
                                                      color: i.buttonPrimaryColor),
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
