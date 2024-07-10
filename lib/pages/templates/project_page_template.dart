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
import '../../components/projects/youtube_section.dart';
import '../../providers/project_component_constraint_provider.dart';
import '../../providers/scroll_provider.dart';

class ProjectPageTemplate extends StatelessWidget {
  const ProjectPageTemplate({
    super.key,
    required this.projectTitle,
    required this.bannerImage,
    required this.sections,
    required this.tableOfContents,
    required this.timelineIcons,
    required this.secondaryColor,
    required this.primaryColor,
  });

  final List sections;
  final List<TableOfContentsComponent> tableOfContents;
  final String bannerImage;
  final String projectTitle;
  final List<IconData> timelineIcons;
  final Color secondaryColor;
  final Color primaryColor;

  double _projectBannerHeight(double height) => height; //width / 2.193333333; // 900
  double _projectBannerWidth(double width) => 1500; //width / 1.316; // 1500

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

  List<Container> _buildTextSections(List sections, ProjectComponentsConstraintsProvider componentsConstraintsProvider,
      bool isLengthGreaterThanWidth) {
    List<Container> builtSections = [];
    for (int i = 0; i < sections.length; i++) {
      builtSections.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: isLengthGreaterThanWidth ? 30 : 56), //width / 35.74), // 56
          alignment: Alignment.centerLeft,
          key: componentsConstraintsProvider.titleKeys[i],
          child: SelectableText(
            sections[i].title,
            style: TextStyle(fontSize: isLengthGreaterThanWidth ? 35 : 55), //width / 35.890909), // 55
          ),
        ),
      );
      if (sections[i] is HtmlSection) {
        builtSections.add(
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                vertical: isLengthGreaterThanWidth ? 20 : 60, horizontal: isLengthGreaterThanWidth ? 30 : 56),
            // width / 35.74),
            padding: isLengthGreaterThanWidth ? const EdgeInsets.all(40) : const EdgeInsets.all(80),
            //width / 24.675),
            decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(30)),
            child: FutureBuilder<String>(
              future: _loadHtmlFile(sections[i].bodyPath),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Consumer<ProjectComponentsConstraintsProvider>(
                    builder: (context, provider, _) {
                      return SizedBox(
                        height: provider.textContainerHeights[i], // Replace with the height from your provider
                        child: Html(
                          data: snapshot.data,
                          style: {
                            "body": Style(
                              fontSize: isLengthGreaterThanWidth ? FontSize(12) : FontSize(19.78),
                            ),
                            //FontSize(width / 100)), // Adjust the font size as needed
                            ".techstack": Style(
                                height: Height(80), //width / 24.966667),
                                width: Width(80), //width / 24.966667),
                                margin: Margins.only(right: 20)),
                            ".techstack-small": Style(
                                height: Height(92), //width / 21.4307),
                                width: Width(92), //width / 21.4307),
                                margin: Margins.only(right: 20)),
                            ".portrait-img": Style(
                              height: Height(700), //width / 2.8257),
                              margin: Margins.only(right: 90), //width / 21.97778),
                            ),
                            ".old-new": Style(
                              padding: HtmlPaddings.only(
                                left: 56, //width / 35,
                                right: 56, //width / 35,
                                bottom: 40,
                              ),
                            ),
                            ".demo-img": Style(
                              height: Height(700), //width / 2.825714),
                            )
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
                                  key: componentsConstraintsProvider.sectionKeys[i],
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
        );
      } else if (sections[i] is YoutubeSection) {
        builtSections.add(
          Container(
            margin: EdgeInsets.symmetric(
                vertical: isLengthGreaterThanWidth ? 20 : 60, horizontal: isLengthGreaterThanWidth ? 30 : 56),
            // width / 35.74),
            padding: isLengthGreaterThanWidth ? const EdgeInsets.all(40) : const EdgeInsets.all(80),
            //width / 24.675),
            decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(30)),
            child: sections[i],
          ),
        );
      }
    }
    return builtSections;
  }

  @override
  Widget build(BuildContext context) {
    double width = 1978;
    double height = MediaQuery.of(context).size.height < 1048 ? 1048 : MediaQuery.of(context).size.height;

    ScrollProvider scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    ProjectComponentsConstraintsProvider componentsConstraintsProvider =
        Provider.of<ProjectComponentsConstraintsProvider>(context, listen: false);

    scrollProvider.bannerHeight = _projectBannerHeight(height);
    scrollProvider.width = width;

    componentsConstraintsProvider.initHeights(sections.length);
    componentsConstraintsProvider.sectionKeys = List.generate(sections.length, (index) => GlobalKey());
    componentsConstraintsProvider.titleKeys = List.generate(sections.length, (index) => GlobalKey());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollProvider.tableOfContentsListener(scrollProvider.bannerHeight, width);
      componentsConstraintsProvider.startRenderTimer();
    });

    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;

    if (isLengthGreaterThanWidth) {
      height = height - 40;
      width = 455;
    } else {
      height -= 150;
    }

    return ResponsiveScaledBox(
      width: width,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            projectTitle,
            style: const TextStyle(fontSize: 25), //width / 79.12),
          ),
          toolbarHeight: scrollProvider.appBarHeight,
          shadowColor: Colors.black,
          backgroundColor: secondaryColor,
          elevation: 1,
        ),
        floatingActionButton: isLengthGreaterThanWidth
            ? FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Table of contents', style: TextStyle(fontSize: 30)),
                      content: TableOfContents(tableOfContents: tableOfContents, fontColor: primaryColor),
                    ),
                  );
                },
                backgroundColor: secondaryColor,
                child: const Icon(Icons.menu),
              )
            : null,
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
                              height: _projectBannerHeight(height),
                              width: _projectBannerWidth(width),
                              image: bannerImage),
                          BannerTitle(
                              height: _projectBannerHeight(height),
                              width: _projectBannerWidth(width),
                              title: projectTitle)
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: isLengthGreaterThanWidth ? 100 : 200), //width / 9.87), // 200
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
                              if (!isLengthGreaterThanWidth)
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
                                              size: Size(width * 0.3, (300).toDouble()),
                                              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                              painter: TOCHeader(shapeColor: primaryColor),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 150, // height / 8.0615384615,
                                                margin: const EdgeInsets.only(bottom: 30),
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  'Table of contents',
                                                  style: TextStyle(
                                                    fontSize: 35, //width / 56.4,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Consumer<ProjectComponentsConstraintsProvider>(
                                                builder: (context, componentsConstraintsProvider, child) {
                                                  return TableOfContents(
                                                    tableOfContents: tableOfContents,
                                                    fontColor: primaryColor,
                                                  );
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
                                  padding: EdgeInsets.symmetric(horizontal: isLengthGreaterThanWidth ? 0 : 55),
                                  //width / 35.74), // 100
                                  child: SingleChildScrollView(
                                    child: ProjectTimeLine(
                                      sections: _buildTextSections(
                                          sections, componentsConstraintsProvider, isLengthGreaterThanWidth),
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
                    top: _projectBannerHeight(height) - 40,
                    left: width / 2 - 40,
                    child: SizedBox(
                      width: 80, //width / 24.675,
                      height: 80,
                      child: FloatingActionButton(
                        backgroundColor: secondaryColor,
                        onPressed: () => scrollProvider.scrollToProjectDescription(_projectBannerHeight(height) + 150),
                        // width / 13.16 = 150
                        shape: const CircleBorder(),
                        child: const Icon(
                          LineIcons.arrowDown,
                          size: 30, //width / 65.8,
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
