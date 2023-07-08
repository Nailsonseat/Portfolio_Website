import 'package:flutter/material.dart';
import 'package:portfolio_website/pages/home/home_page.dart';
import 'package:portfolio_website/pages/projects/project_browser_main.dart';
import 'package:portfolio_website/pages/about_me/about_me_page.dart';
import 'package:portfolio_website/providers/scroll_to_top_provider.dart';
import 'package:provider/provider.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width = width < 800 ? 800 : width;

    ScrollTopProvider scrollProvider = Provider.of<ScrollTopProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Aadarsh Verma'),
      ),
      floatingActionButton: Consumer<ScrollTopProvider>(builder: (context, scrollProvider, _) {
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
      }),
      body: SizedBox(
        width: width,
        child: SingleChildScrollView(
          controller: scrollProvider.scrollController,
          scrollDirection: Axis.vertical,
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                HomePageOne(),
                HomePageTwo(),
                HomePageThree()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
