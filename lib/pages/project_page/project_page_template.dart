import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../providers/scroll_provider.dart';

class ProjectPageTemplate extends StatelessWidget {
  const ProjectPageTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    width = width < 800 ? 800 : width;

    ScrollProvider scrollProvider = Provider.of<ScrollProvider>(context, listen: false);

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
                            height: 900,
                            width: 1500,
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
                          height: 900,
                          width: 1500,
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
                      height: height,
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
                              child: Column(
                                children: [
                                  // SizedBox(height: 200),
                                  Container(
                                    padding: EdgeInsets.only(left: 100),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Description",
                                      style: TextStyle(fontSize: 55),
                                    ),
                                  ),
                                  Container(
                                    height: 900,
                                    margin: EdgeInsets.symmetric(horizontal: 100, vertical: 60),
                                    decoration:
                                        BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 100),
                                    child: Text(
                                      "Progress and milestones",
                                      style: TextStyle(fontSize: 55),
                                    ),
                                  ),
                                  Container(
                                    height: 900,
                                    margin: EdgeInsets.symmetric(horizontal: 100, vertical: 60),
                                    decoration:
                                        BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
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
                Positioned(
                  top: 900 - 40,
                  left: width / 2 - 40,
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: FloatingActionButton(
                      onPressed: () => scrollProvider.scrollToProjectDescription(900+200),
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
