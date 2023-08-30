import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio_website/components/projects/banner_image.dart';
import 'package:portfolio_website/components/projects/banner_title.dart';
import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import '../../../components/projects/text_section.dart';
import '../../../providers/scroll_provider.dart';

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
          margin: EdgeInsets.symmetric(horizontal: width / 35.74),
          alignment: Alignment.centerLeft,
          child: Text(
            i.title,
            style: TextStyle(fontSize: width / 35.890909), // 55
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 60, horizontal: width / 35.74),
          padding: EdgeInsets.all(width / 24.675),
          decoration: BoxDecoration(color: Colors.deepPurple[50]?.withOpacity(0.7), borderRadius: BorderRadius.circular(30)),
          child: FutureBuilder<String>(
            future: _loadHtmlFile(i.bodyPath),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: HtmlWidget(
                    snapshot.data!, // HTML content from the file
                    customStylesBuilder: (node) {
                      if (node.localName == 'ul') {
                        return {
                          'color': 'black',
                          'font-size': '18px',
                        };
                      } else if (node.localName == 'p') {
                        return {'color': 'black', 'font-size': '18px'};
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
                        BannerImage(
                            height: _projectBannerHeight(width), width: _projectBannerWidth(width), image: bannerImage),
                        BannerTitle(
                            height: _projectBannerHeight(width), width: _projectBannerWidth(width), title: projectTitle)
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
                              flex: 10,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: width / 35.74), // 100
                                child: FixedTimeline.tileBuilder(
                                  theme: TimelineTheme.of(context).copyWith(
                                    nodePosition: 0,
                                  ),
                                  builder: TimelineTileBuilder.connected(
                                    contentsAlign: ContentsAlign.basic,
                                    connectorBuilder: (context, index, type) {
                                      if (index == 2) {
                                        return const DashedLineConnector(thickness: 3,gap: 6,color: Colors.black,);
                                      }
                                      return const SolidLineConnector(
                                        color: Colors.black,
                                      );
                                    },
                                    indicatorBuilder: (context, index) {
                                      return ContainerIndicator(
                                        child: Container(
                                          width: 70,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: Colors.lightBlueAccent)
                                          ),
                                        ),
                                      );
                                    },
                                    contentsBuilder: (context, index) => _buildTextSections(textSections, width)[index],
                                    itemCount: _buildTextSections(textSections, width).length,
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
