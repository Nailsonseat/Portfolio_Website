import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio_website/components/projects/banner_image.dart';
import 'package:portfolio_website/components/projects/banner_title.dart';
import 'package:portfolio_website/components/projects/table_of_contents_component.dart';
import 'package:portfolio_website/components/projects/table_of_contents.dart';
import 'package:portfolio_website/components/projects/timeline.dart';
import 'package:portfolio_website/templates/section_builder.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../components/projects/table_of_contents_header.dart';
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
    required this.backgroundShapeColor,
    required this.foregroundShapeColor,
  });

  final List sections;
  final List<TableOfContentsComponent> tableOfContents;
  final String bannerImage;
  final String projectTitle;
  final List<IconData> timelineIcons;
  final Color backgroundShapeColor;
  final Color foregroundShapeColor;

  double _projectBannerHeight(double height) => height; //width / 2.193333333; // 900
  double _projectBannerWidth(double width) => 1500; //width / 1.316; // 1500

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
          backgroundColor: backgroundShapeColor,
          elevation: 1,
        ),
        floatingActionButton: isLengthGreaterThanWidth
            ? FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Table of contents', style: TextStyle(fontSize: 30)),
                      content: TableOfContents(tableOfContents: tableOfContents, fontColor: foregroundShapeColor),
                    ),
                  );
                },
                backgroundColor: backgroundShapeColor,
                child: const Icon(Icons.menu),
              )
            : null,
        backgroundColor: Colors.white,
        body: RawScrollbar(
          thumbVisibility: true,
          controller: scrollProvider.detailedProjectScrollController,
          thumbColor: foregroundShapeColor,
          radius: const Radius.circular(16),
          thickness: 22,
          child: SingleChildScrollView(
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
                                        color: backgroundShapeColor,
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
                                                painter: TOCHeader(shapeColor: foregroundShapeColor),
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
                                                      fontColor: foregroundShapeColor,
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
                                        sections: buildSections(
                                            sections: sections,
                                            componentsConstraintsProvider: componentsConstraintsProvider,
                                            isLengthGreaterThanWidth: isLengthGreaterThanWidth,
                                            sectionBoxColor: backgroundShapeColor),
                                        timelineIcons: timelineIcons,
                                        timelineBlockColor: foregroundShapeColor,
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
                          backgroundColor: backgroundShapeColor,
                          onPressed: () =>
                              scrollProvider.scrollToProjectDescription(_projectBannerHeight(height) + 150),
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
      ),
    );
  }
}
