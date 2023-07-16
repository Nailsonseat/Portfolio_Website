import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:provider/provider.dart';
import '../../components/projects/text_section.dart';
import '../../providers/scroll_provider.dart';

class ProjectPageTemplate extends StatelessWidget {
  ProjectPageTemplate({
    super.key,
    required this.projectTitle,
    required this.bannerImage,
    required this.textSections,
    required this.projectComponents,
  });

  final List<TextSection> textSections;
  final List<ProjectComponent> projectComponents;
  final String bannerImage;
  final String projectTitle;

  double _projectBannerHeight(double width) => width / 2.193333333; // 900
  double _projectBannerWidth(double width) => width / 1.316; // 1500

  final GlobalKey containerKey = GlobalKey();

  Future<String> _loadHtmlFile(String path) async => await rootBundle.loadString(path);

  List<Widget> _buildTextSections(List textSections, double width) {
    List<Widget> builtSections = [];
    for (TextSection i in textSections) {
      builtSections.addAll([
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            i.title,
            style: TextStyle(fontSize: width / 35.890909), // 55
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 60),
          padding: EdgeInsets.all(width / 24.675),
          decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
          child: FutureBuilder<String>(
            future: _loadHtmlFile(i.bodyPath),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: HtmlWidget(
                    snapshot.data!, // HTML content from the file
                    customStylesBuilder: (node) {
                      if (node.localName == 'h1') {
                        return {
                          'color': 'black',
                          'font-size': '26px',
                        };
                      } else if (node.localName == 'p') {
                        return {
                          'color': 'red',
                          'font-weight': 'bold',
                        };
                      }
                      return null; // Return null for other elements, no custom styles needed.
                    },
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error loading HTML file'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),

        ),
      ]);
    }
    return builtSections;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width = width < 800 ? 800 : width;

    ScrollProvider scrollProvider = Provider.of<ScrollProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //RenderBox renderer = containerKey.currentContext!.findRenderObject() as RenderBox;
      //Logger().w(renderer.size.height);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(projectTitle),
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
                                image: AssetImage(bannerImage),
                                fit: BoxFit.fill,
                              ),
                              color: Colors.white,
                            ),
                            child: ShaderMask(
                              blendMode: BlendMode.dstIn,
                              child: Container(
                                color: Colors.white,
                              ),
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
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
                              AutoSizeText(
                                projectTitle,
                                maxLines: 2,
                                minFontSize: 80,
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
                      padding: EdgeInsets.only(top: width / 9.87), // 200
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      width: width,
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(30)),
                                  color: Colors.grey[100],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Consumer<ScrollProvider>(builder: (_, scrollProvider, __) {
                                      return SizedBox(height: width / 112.8 + scrollProvider.tableOfContentsOffset);
                                    }),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Table of contents',
                                        style: TextStyle(fontSize: width / 56.4), // 35
                                      ),
                                    ),
                                    /*for (ProjectComponent i in projectComponents)
                                      TextButton(onPressed: () {}, child: Text(i.title))*/
                                    Image.asset("lib/assets/images/miscellaneous/under_construction.png")
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 9,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: width / 19.74), // 100
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _buildTextSections(textSections, width),
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
                  top: _projectBannerHeight(width) - width / 49.35,
                  left: width / 2 - width / 49.35,
                  child: SizedBox(
                    width: width / 24.675,
                    height: width / 24.675,
                    child: FloatingActionButton(
                      onPressed: () =>
                          scrollProvider.scrollToProjectDescription(_projectBannerHeight(width) + width / 13.16),
                      // width / 13.16 = 150
                      shape: const CircleBorder(),
                      child: Icon(
                        LineIcons.arrowDown,
                        size: width / 65.8,
                      ),
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
