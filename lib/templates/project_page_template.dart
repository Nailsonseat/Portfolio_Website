import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio_website/components/projects/banner_image.dart';
import 'package:portfolio_website/components/projects/banner_title.dart';
import 'package:portfolio_website/components/projects/table_of_contents_component.dart';
import 'package:portfolio_website/components/projects/table_of_contents.dart';
import 'package:portfolio_website/components/projects/timeline.dart';
import 'package:portfolio_website/templates/section_builder.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../blocs/project_page/section_layout_cubit.dart';
import '../blocs/project_page/table_of_contents_offset_cubit.dart';
import '../components/projects/table_of_contents_header.dart';
import '../constants/layout.dart';

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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TableOfContentsOffsetCubit()),
        BlocProvider(create: (_) => SectionLayoutCubit(sectionCount: sections.length)),
      ],
      child: _ProjectPageView(page: this),
    );
  }
}

class _ProjectPageView extends StatefulWidget {
  const _ProjectPageView({required this.page});

  final ProjectPageTemplate page;

  @override
  State<_ProjectPageView> createState() => _ProjectPageViewState();
}

class _ProjectPageViewState extends State<_ProjectPageView> {
  static const int _measurePasses = 10;
  static const Duration _measureInterval = Duration(milliseconds: 500);

  final ScrollController _scrollController = ScrollController();
  late final List<GlobalKey> _sectionKeys = List.generate(widget.page.sections.length, (_) => GlobalKey());
  late final List<GlobalKey> _titleKeys = List.generate(widget.page.sections.length, (_) => GlobalKey());
  Timer? _measureTimer;
  Size? _lastScreenSize;
  double _bannerHeight = 0;

  double _projectBannerHeight(double height) => height; //width / 2.193333333; // 900
  double _projectBannerWidth(double width) => 1500; //width / 1.316; // 1500

  /// Screen height clamped to the minimum the layout is designed for.
  double _layoutHeight(Size screenSize) => screenSize.height < 1048 ? 1048 : screenSize.height;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // HTML sections reflow when the screen size changes, so re-measure them.
    final screenSize = MediaQuery.sizeOf(context);
    if (screenSize != _lastScreenSize) {
      _lastScreenSize = screenSize;
      _bannerHeight = _projectBannerHeight(_layoutHeight(screenSize));
      _startMeasuringSections();
    }
  }

  @override
  void dispose() {
    _measureTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    context
        .read<TableOfContentsOffsetCubit>()
        .onScrolled(offset: _scrollController.offset, bannerHeight: _bannerHeight);
  }

  /// Rendered HTML heights aren't known until images and fonts settle, so
  /// sample them a few times after layout.
  void _startMeasuringSections() {
    _measureTimer?.cancel();
    var passes = 0;
    _measureTimer = Timer.periodic(_measureInterval, (timer) {
      if (passes++ >= _measurePasses) {
        timer.cancel();
        return;
      }
      _measureSections();
    });
  }

  void _measureSections() {
    context.read<SectionLayoutCubit>().updateHeights([
      for (final key in _sectionKeys)
        switch (key.currentContext?.findRenderObject()) {
          final RenderBox box when box.hasSize => box.size.height,
          _ => null,
        },
    ]);
  }

  void _scrollToProjectDescription(double position) {
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProjectPageTemplate(
      :projectTitle,
      :bannerImage,
      :sections,
      :tableOfContents,
      :timelineIcons,
      :backgroundShapeColor,
      :foregroundShapeColor,
    ) = widget.page;

    double width = 1978;
    double height = _layoutHeight(MediaQuery.sizeOf(context));

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
          toolbarHeight: kAppBarHeight,
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
                      content: TableOfContents(
                        tableOfContents: tableOfContents,
                        titleKeys: _titleKeys,
                        fontColor: foregroundShapeColor,
                      ),
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
          controller: _scrollController,
          thumbColor: foregroundShapeColor,
          radius: const Radius.circular(16),
          thickness: 22,
          child: SingleChildScrollView(
            controller: _scrollController,
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
                                color: Colors.grey.withValues(alpha: 0.5),
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
                                          BlocBuilder<TableOfContentsOffsetCubit, double>(
                                            builder: (_, offset) => SizedBox(height: offset),
                                          ),
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
                                                TableOfContents(
                                                  tableOfContents: tableOfContents,
                                                  titleKeys: _titleKeys,
                                                  fontColor: foregroundShapeColor,
                                                ),
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
                                            sectionKeys: _sectionKeys,
                                            titleKeys: _titleKeys,
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
                              _scrollToProjectDescription(_projectBannerHeight(height) + 150),
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
