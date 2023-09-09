import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio_website/components/projects/banner_image.dart';
import 'package:portfolio_website/components/projects/banner_title.dart';
import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:portfolio_website/components/projects/timeline.dart';
import 'package:provider/provider.dart';
import '../../components/projects/table_of_contents_header.dart';
import '../../components/projects/text_section.dart';
import '../../providers/scroll_provider.dart';

class ProjectPageTemplate extends StatelessWidget {
  ProjectPageTemplate({
    super.key,
    required this.projectTitle,
    required this.bannerImage,
    required this.textSections,
    required this.projectComponents,
    required this.timelineIcons,
    required this.containerColor,
    required this.timelineBlockColor,
    required this.primaryColor,
  });

  final List<TextSection> textSections;
  final List<ProjectComponent> projectComponents;
  final String bannerImage;
  final String projectTitle;
  final List<IconData> timelineIcons;
  final Color containerColor;
  final Color timelineBlockColor;
  final Color primaryColor;

  double _projectBannerHeight(double width) => width / 2.193333333; // 900
  double _projectBannerWidth(double width) => width / 1.316; // 1500

  final GlobalKey containerKey = GlobalKey();

  Future<String> _loadHtmlFile(String path) async => await rootBundle.loadString(path);

  void _redirect(String link) async {
    try {
      if (!await launchUrl(Uri.parse(link))) {
        throw ('Error launching url');
      }
    } catch (error) {
      Logger().e(error);
    }
  }

  List<Container> _buildTextSections(
      List textSections, double width, ProjectComponentsConstraintsProvider componentsConstraintsProvider) {
    List<Container> builtSections = [];
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
          decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(30)),
          child: FutureBuilder<String>(
            future: _loadHtmlFile(i.bodyPath),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Consumer<ProjectComponentsConstraintsProvider>(
                  builder: (context, provider, _) {
                    return SizedBox(
                      height: provider.textContainerHeights[i], // Replace with the height from your provider
                      child: Html(
                        data: snapshot.data,
                        style: {
                          "body": Style(fontSize: FontSize(18.0)), // Adjust the font size as needed
                          ".techstack": Style(height: Height(60), width: Width(60), margin: Margins.only(right: 20)),
                        },
                        onAnchorTap: (String? url, _, __) => _redirect(url!),
                        extensions: [
                          const SvgHtmlExtension(),
                          TagWrapExtension(
                            tagsToWrap: {"body"},
                            builder: (child) {
                              return Container(
                                key: componentsConstraintsProvider.textKeys[i],
                                child: child,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
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

  Column createTableOfContents() {
    List<Widget> contents = [];
    for (ProjectComponent i in projectComponents) {
      contents.addAll([
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.circle,color: timelineBlockColor,),
            TextButton(
              onPressed: () {},
              child: Text(
                i.title,
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
        Divider(
          height: 2,
          indent: 50,
          endIndent: 50,
        )
      ]);
      for (String j in i.subComponents) {
        contents.addAll([
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle,color: timelineBlockColor,),
              Container(
                padding: EdgeInsets.all(15),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    j,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 2,
          ),
        ]);
      }
    }
    return Column(
      children: contents,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    width = width < 800 ? 800 : width;

    ScrollProvider scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    scrollProvider.bannerHeight = _projectBannerHeight(width);
    scrollProvider.width = width;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //RenderBox renderer = containerKey.currentContext!.findRenderObject() as RenderBox;
      //Logger().w(renderer.size.height);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(projectTitle,style: TextStyle(fontSize: 25),),
        toolbarHeight: scrollProvider.appBarHeight,
        shadowColor: Colors.black,
        backgroundColor: primaryColor,
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
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(50)),
                                  color: containerColor,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Consumer<ScrollProvider>(builder: (_, scrollProvider, __) {
                                      return SizedBox(height: 0 + scrollProvider.tableOfContentsOffset);
                                    }),
                                    Stack(children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(topRight: Radius.circular(50)),
                                        child: CustomPaint(
                                          size: Size(width * 0.3, (height / 4.192).toDouble()),
                                          //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                          painter: TOCHeader(shapeColor: timelineBlockColor),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            height: height / 8.0615384615,
                                            margin: EdgeInsets.only(bottom: 30),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Table of contents',
                                              style: TextStyle(fontSize: width / 56.4, color: Colors.white), // 35
                                            ),
                                          ),
                                          createTableOfContents(),
                                        ],
                                      ),
                                    ]),
                                    //Image.asset("lib/assets/images/miscellaneous/under_construction.png")
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: width / 35.74), // 100
                                child: ProjectTimeLine(
                                  textSections: _buildTextSections(textSections, width),
                                  timelineIcons: timelineIcons,
                                  timelineBlockColor: timelineBlockColor,
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
                      backgroundColor: primaryColor,
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
