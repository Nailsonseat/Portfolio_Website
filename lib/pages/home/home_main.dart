import 'package:flutter/material.dart';
import 'package:portfolio_website/pages/home/home_page_one.dart';
import 'package:portfolio_website/pages/home/home_page_two.dart';

class HomeMain extends StatelessWidget {
   HomeMain({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    width = width < 800 ? 800 : width;

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
      body: SizedBox(
        width: width,
        child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                HomePageOne(),
                HomePageTwo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}