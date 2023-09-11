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

    if (width < 1200 || height < 768) {
      return const SmallScreenWidget();
    }

    width = width < 800 ? 800 : width;

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
        title: Text(
          'Aadarsh Verma',
          style: TextStyle(fontSize: _appBarFontSize(width, height)),
        ),
      ),
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
