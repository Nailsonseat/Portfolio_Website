import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../providers/scroll_provider.dart';

class ProjectPageTemplate extends StatelessWidget {
  const ProjectPageTemplate({super.key});

  double _projectBannerHeight(double width) => width / 2.193333333; // 900

  double _projectBannerWidth(double width) => width / 1.316; // 1500

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width = width < 800 ? 800 : width;

    ScrollProvider scrollProvider = Provider.of<ScrollProvider>(context, listen: false);

    GlobalKey key = GlobalKey();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox renderer = key.currentContext!.findRenderObject() as RenderBox;
      Logger().w(renderer.size.height);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acharya Setu'),
        toolbarHeight: scrollProvider.appBarHeight,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: scrollProvider.detailedProjectScrollController,
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: width,
            child: Stack(
              children: [
                Column(
                  children: <Widget>[
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: _projectBannerHeight(width),
                            width: _projectBannerWidth(width),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('lib/assets/images/project_images/acharya_setu.jpg'),
                                    fit: BoxFit.fill),
                                color: Colors.white),
                            child: ShaderMask(
                              blendMode: BlendMode.dstIn,
                              child: Container(
                                color: Colors.white,
                              ),
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.white, Colors.transparent],
                                  stops: [0.1, 0.7],
                                ).createShader(bounds);
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(left: 230),
                          height: _projectBannerHeight(width),
                          width: _projectBannerWidth(width),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Acharya Setu',
                                style: GoogleFonts.comfortaa(
                                  fontSize: 110,
                                  shadows: [
                                    const Shadow(
                                      offset: Offset(0, 2), // Specify the shadow offset
                                      color: Colors.grey,
                                      blurRadius: 3, // Specify the blur radius of the shadow
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 200),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      width: width,
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                //margin: EdgeInsets.only(top: 200),
                                color: Colors.tealAccent,
                                child: Column(
                                  children: <Widget>[
                                    Consumer<ScrollProvider>(builder: (_, scrollProvider, __) {
                                      return SizedBox(height: 15 + scrollProvider.tableOfContentsOffset);
                                    }),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Table of contents',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              flex: 3,
                            ),
                            Expanded(
                              flex: 9,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: width / 19.74), // 100
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Description",
                                        style: TextStyle(fontSize: width / 35.890909), // 55
                                      ),
                                    ),
                                    Container(
                                      key: key,
                                      height: 900,
                                      child: SizedBox.expand(
                                        child: AutoSizeText(
                                          "Progress was made",
                                          style: GoogleFonts.robotoMono(fontSize: width / 98.7),
                                        ),
                                      ),
                                      margin: const EdgeInsets.symmetric(vertical: 60),
                                      padding: EdgeInsets.all(width / 24.675),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: _projectBannerHeight(width) - 40,
                  left: width / 2 - 40,
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: FloatingActionButton(
                      onPressed: () => scrollProvider.scrollToProjectDescription(_projectBannerHeight(width) + 150),
                      child: Icon(
                        LineIcons.arrowDown,
                        size: 30,
                      ),
                      shape: CircleBorder(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
