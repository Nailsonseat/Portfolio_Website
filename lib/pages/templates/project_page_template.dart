import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_audio/flutter_html_audio.dart';
import 'package:flutter_html_iframe/flutter_html_iframe.dart';
import 'package:flutter_html_svg/flutter_html_svg.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_html_video/flutter_html_video.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_website/components/projects/banner_image.dart';
import 'package:portfolio_website/components/projects/banner_title.dart';
import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:portfolio_website/components/projects/table_of_contents.dart';
import 'package:portfolio_website/components/projects/timeline.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/projects/table_of_contents_header.dart';
import '../../components/projects/text_section.dart';
import '../../providers/project_component_constraint_provider.dart';
import '../../providers/scroll_provider.dart';

class ProjectPageTemplate extends StatelessWidget {
  const ProjectPageTemplate({
    super.key,
    required this.projectTitle,
    required this.bannerImage,
    required this.textSections,
    required this.tableOfContents,
    required this.timelineIcons,
    required this.secondaryColor,
    required this.primaryColor,
  });

  final List<TextSection> textSections;
  final List<TableOfContentsComponent> tableOfContents;
  final String bannerImage;
  final String projectTitle;
  final List<IconData> timelineIcons;
  final Color secondaryColor;
  final Color primaryColor;

  double _projectBannerHeight(double width) => width / 2.193333333; // 900
  double _projectBannerWidth(double width) => width / 1.316; // 1500

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
    for (int i = 0; i < textSections.length; i++) {
      builtSections.addAll([
        Container(
          margin: EdgeInsets.symmetric(horizontal: width / 35.74),
          alignment: Alignment.centerLeft,
          key: componentsConstraintsProvider.titleKeys[i],
          child: SelectableText(
            textSections[i].title,
            style: TextStyle(fontSize: width / 35.890909), // 55
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 60, horizontal: width / 35.74),
          padding: EdgeInsets.all(width / 24.675),
          decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(30)),
          child: FutureBuilder<String>(
            future: _loadHtmlFile(textSections[i].bodyPath),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Consumer<ProjectComponentsConstraintsProvider>(
                  builder: (context, provider, _) {
                    return SizedBox(
                      height: provider.textContainerHeights[i], // Replace with the height from your provider
                      child: Html(
                        data: snapshot.data,
                        style: {
                          "body": Style(fontSize: FontSize(width / 100)), // Adjust the font size as needed
                          ".techstack": Style(
                              height: Height(width / 24.966667),
                              width: Width(width / 24.966667),
                              margin: Margins.only(right: 20)),
                          ".techstack-small": Style(
                              height: Height(width / 21.4307),
                              width: Width(width / 21.4307),
                              margin: Margins.only(right: 20)),
                          ".portrait-img":
                              Style(height: Height(width / 2.8257), margin: Margins.only(right: width / 21.97778)),
                          ".old-new": Style(padding: HtmlPaddings.only(left: width / 35, right: width / 35, bottom: 40)),
                          ".demo-img": Style(height: Height(width / 2.825714))
                        },
                        onAnchorTap: (String? url, _, __) => _redirect(url!),
                        extensions: [
                          const VideoHtmlExtension(),
                          const AudioHtmlExtension(),
                          const IframeHtmlExtension(),
                          const TableHtmlExtension(),
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

  @override
  Widget build(BuildContext context) {
    double width = 1978;
    double height = 1048;

    ScrollProvider scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    ProjectComponentsConstraintsProvider componentsConstraintsProvider =
        Provider.of<ProjectComponentsConstraintsProvider>(context, listen: false);

    scrollProvider.bannerHeight = _projectBannerHeight(width);
    scrollProvider.width = width;

    componentsConstraintsProvider.initHeights(textSections.length);
    componentsConstraintsProvider.textKeys = List.generate(textSections.length, (index) => GlobalKey());
    componentsConstraintsProvider.titleKeys = List.generate(textSections.length, (index) => GlobalKey());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      componentsConstraintsProvider.setTitleContainerHeight();
      scrollProvider.tableOfContentsListner(scrollProvider.bannerHeight, width);
      componentsConstraintsProvider.startRenderTimer();
    });

    return ResponsiveScaledBox(
      width: width,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            projectTitle,
            style: TextStyle(fontSize: width / 79.12),
          ),
          toolbarHeight: scrollProvider.appBarHeight,
          shadowColor: Colors.black,
          backgroundColor: secondaryColor,
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
                              height: _projectBannerHeight(width),
                              width: _projectBannerWidth(width),
                              image: bannerImage),
                          BannerTitle(
                              height: _projectBannerHeight(width),
                              width: _projectBannerWidth(width),
                              title: projectTitle)
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
                                    color: secondaryColor,
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
                                            painter: TOCHeader(shapeColor: primaryColor),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: height / 8.0615384615,
                                              margin: const EdgeInsets.only(bottom: 30),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Table of contents',
                                                style: TextStyle(fontSize: width / 56.4, color: Colors.white), // 35
                                              ),
                                            ),
                                            Consumer<ProjectComponentsConstraintsProvider>(
                                              builder: (context, componentsConstraintsProvider, child) {
                                                return TableOfContents(
                                                    tableOfContents: tableOfContents, fontColor: primaryColor);
                                              },
                                            )
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
                                  child: SingleChildScrollView(
                                    child: ProjectTimeLine(
                                      textSections:
                                          _buildTextSections(textSections, width, componentsConstraintsProvider),
                                      timelineIcons: timelineIcons,
                                      timelineBlockColor: primaryColor,
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
                        backgroundColor: secondaryColor,
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
      ),
    );
  }
}
