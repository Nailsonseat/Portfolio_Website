import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/pages/home/home_page.dart';
import 'package:portfolio_website/pages/about_me/about_me_page.dart';
import 'package:portfolio_website/providers/scroll_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../project_browser/project_browser_main.dart';
import 'package:universal_html/html.dart';
class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    double height = window.screen?.available.height as double;

    ScrollProvider scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    scrollProvider.appBarHeight = height / 13.15 < 60 ? 60 : height / 13.15;

    Future<String> getLicense() async {
      String aboutMe = await rootBundle.loadString("LICENSE");
      return aboutMe;
    }

    return ResponsiveScaledBox(
      width: 1978,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 1,
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            toolbarHeight: 80,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { },
            ),
            actions: [
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('visitor_counts').doc('home_page_visitors').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final count = snapshot.data!['count'] ?? 0;
                  return ElevatedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => ResponsiveScaledBox(
                        width: 1978,
                        child: Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                          child: IntrinsicWidth(
                            child: IntrinsicHeight(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(23.0),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: SelectableText(
                                          "Aadarsh's Portfolio Website",
                                          style: GoogleFonts.roboto(fontSize: 35),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: SelectableText(
                                        "Welcome to my portfolio website\nYou are the $count visitor\nOr you could have been the ${count - 1} visitor and just reloaded the website which would be cheating ;)",
                                        style: const TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 23),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (context) => ResponsiveScaledBox(
                                                  width: 1978,
                                                  child: Dialog(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(0.0),
                                                      child: FutureBuilder<String>(
                                                        future: getLicense(),
                                                        builder: (context, snapshot) {
                                                          if (snapshot.hasData) {
                                                            return Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: SingleChildScrollView(
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(20.0),
                                                                      child: Column(
                                                                        children: [
                                                                          SelectableText(
                                                                            snapshot.data!,
                                                                            textAlign: TextAlign.center,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(16.0),
                                                                  child: ElevatedButton(
                                                                    onPressed: () => context.pop(),
                                                                    style: ElevatedButton.styleFrom(
                                                                      elevation: 2.5,
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                      ),
                                                                      fixedSize: const Size.fromHeight(35.0),
                                                                    ),
                                                                    child: const Text("Ok"),
                                                                  ),
                                                                ),
                                                              ],
                                                            );

                                                          } else {
                                                            return const SizedBox(
                                                                width: 100,
                                                                height: 100,
                                                                child: Scaffold(
                                                                  backgroundColor: Colors.transparent,
                                                                    body: Center(child: CircularProgressIndicator())));
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                elevation: 2.5, // Add elevation if needed
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                                                ),
                                                fixedSize: const Size.fromHeight(35.0), // Adjust the height as needed
                                              ),
                                              child: const Text(
                                                "Licenses",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () => context.pop(),
                                              style: ElevatedButton.styleFrom(
                                                elevation: 2.5, // Add elevation if needed
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                                                ),
                                                fixedSize: const Size.fromHeight(35.0), // Adjust the height as needed
                                              ),
                                              child: const Text(
                                                "Back",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.tealAccent,
                      elevation: 5, // Add elevation if needed
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                      ),
                      fixedSize: const Size.fromHeight(50.0), // Adjust the height as needed
                    ),
                    child: Text(
                      'Visitor no : $count',
                      style: const TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 60,
              )
            ],
            title: const Text(
              "Aadarsh Verma",
              style: TextStyle(fontSize: 25)//_appBarFontSize(width, height)),
            )),
        floatingActionButton: Consumer<ScrollProvider>(
          builder: (context, scrollProvider, _) {
            return scrollProvider.showFloatingButton
                ? Container(
                    height: 80,
                    width: 80,
                    margin: const EdgeInsets.only(bottom: 25, right: 25),
                    child: FloatingActionButton(
                      onPressed: scrollProvider.scrollToTop,
                      backgroundColor: Colors.greenAccent,
                      child: const Icon(
                        Icons.arrow_upward,
                        size: 30,
                      ),
                    ),
                  )
                : Container();
          },
        ),
        body: SingleChildScrollView(
          controller: scrollProvider.homeScrollController,
          scrollDirection: Axis.vertical,
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                HomeLandingPage(),
                AboutMePage(),
                ProjectPageMain(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
