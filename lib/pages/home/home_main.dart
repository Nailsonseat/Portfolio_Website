import 'package:flutter/material.dart';
import 'package:portfolio_website/pages/home/home_page.dart';
import 'package:portfolio_website/pages/about_me/about_me_page.dart';
import 'package:portfolio_website/providers/scroll_provider.dart';
import 'package:provider/provider.dart';

import '../project_browser/project_browser_main.dart';
import '../templates/small_screen_warning_page.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  _appBarFontSize(double width, double height) {
    double fontSize = height * width / 83065.92;
    return fontSize < 16 ? 16 : fontSize;
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if(Theme.of(context).platform == TargetPlatform.iOS || Theme.of(context).platform == TargetPlatform.android){
      return const SmallScreenWidget();
    }


    width = width < 1200 ? 1200 : width;

    ScrollProvider scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    scrollProvider.appBarHeight = height / 13.15 < 60 ? 60 : height / 13.15;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          toolbarHeight: scrollProvider.appBarHeight,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
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
                    builder: (context) => Dialog(
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
                                          onPressed: () {},
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
          title: Text(
            "Aadarsh Verma",
            style: TextStyle(fontSize: _appBarFontSize(width, height)),
          )),
      floatingActionButton: Consumer<ScrollProvider>(
        builder: (context, scrollProvider, _) {
          return scrollProvider.showFloatingButton
              ? Container(
                  height: width / 24.675,
                  width: width / 24.675,
                  margin: const EdgeInsets.only(bottom: 25, right: 25),
                  child: FloatingActionButton(
                    onPressed: scrollProvider.scrollToTop,
                    backgroundColor: Colors.greenAccent,
                    child: Icon(
                      Icons.arrow_upward,
                      size: width / 65.8,
                    ),
                  ),
                )
              : Container();
        },
      ),
      body: SizedBox(
        width: width,
        child: SingleChildScrollView(
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
