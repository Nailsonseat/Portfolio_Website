import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/pages/home/home_page.dart';
import 'package:portfolio_website/pages/about_me/about_me_page.dart';
import 'package:portfolio_website/blocs/home/scroll_to_top_cubit.dart';
import 'package:portfolio_website/constants/layout.dart';
import 'package:portfolio_website/data/visitor_repository.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../project_browser/project_browser_main.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _projectsSectionKey = GlobalKey();
  late final Stream<int> _visitorCount = context.read<VisitorRepository>().watchVisitorCount();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() => context.read<ScrollToTopCubit>().onScrolled(_scrollController.offset);

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToProjects() {
    final projectsContext = _projectsSectionKey.currentContext;
    if (projectsContext == null) return;
    Scrollable.ensureVisible(
      projectsContext,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0.1,
    );
  }

  Future<String> _getLicense() => rootBundle.loadString("LICENSE");

  @override
  Widget build(BuildContext context) {

    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;

    return ResponsiveScaledBox(
      width: isLengthGreaterThanWidth ? 455 : 1978,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: isLengthGreaterThanWidth ? true : false,
            elevation: isLengthGreaterThanWidth ? 0 : 1,
            shadowColor: Colors.black,
            backgroundColor: isLengthGreaterThanWidth ? Colors.transparent : Colors.white,
            toolbarHeight: kAppBarHeight,
            leading: !isLengthGreaterThanWidth
                ? IconButton(
                    onPressed: () => context.go('/home'),
                    icon: const Icon(Icons.menu),
                    iconSize: 30,
                    color: Colors.black,
                  )
                : null,
            actions: [
              StreamBuilder<int>(
                stream: _visitorCount,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final count = snapshot.data!;
                  return ElevatedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => ResponsiveScaledBox(
                        width: isLengthGreaterThanWidth ? 455 : 1978,
                        child: Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                          child: IntrinsicWidth(
                            child: IntrinsicHeight(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(23.0),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: SelectableText(
                                          "Aadarsh's Portfolio Website",
                                          style: GoogleFonts.roboto(fontSize: 35),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: SelectableText(
                                        "Welcome to my portfolio website\nYou are the $count visitor\nOr you could have been the ${count - 1} visitor and just reloaded the website which would be cheating ;)",
                                        style: const TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 23),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (context) => ResponsiveScaledBox(
                                                  width: isLengthGreaterThanWidth ? 455 : 1978,
                                                  child: Dialog(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(0.0),
                                                      child: FutureBuilder<String>(
                                                        future: _getLicense(),
                                                        builder: (context, snapshot) {
                                                          if (snapshot.hasData) {
                                                            return Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: SingleChildScrollView(
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(20.0),
                                                                      child: Column(
                                                                        children: [
                                                                          SelectableText(
                                                                            snapshot.data!,
                                                                            textAlign: TextAlign.center,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(16.0),
                                                                  child: ElevatedButton(
                                                                    onPressed: () => context.pop(),
                                                                    style: ElevatedButton.styleFrom(
                                                                      elevation: 2.5,
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                      ),
                                                                      fixedSize: const Size.fromHeight(35.0),
                                                                    ),
                                                                    child: const Text("Ok"),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          } else {
                                                            return const SizedBox(
                                                                width: 100,
                                                                height: 100,
                                                                child: Scaffold(
                                                                    backgroundColor: Colors.transparent,
                                                                    body: Center(child: CircularProgressIndicator())));
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                elevation: 2.5, // Add elevation if needed
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8.0), // Adjust the radius as needed
                                                ),
                                                fixedSize: const Size.fromHeight(35.0), // Adjust the height as needed
                                              ),
                                              child: const Text(
                                                "Licenses",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () => context.pop(),
                                              style: ElevatedButton.styleFrom(
                                                elevation: 2.5, // Add elevation if needed
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8.0), // Adjust the radius as needed
                                                ),
                                                fixedSize: const Size.fromHeight(35.0), // Adjust the height as needed
                                              ),
                                              child: const Text(
                                                "Back",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ],
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
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.tealAccent,
                      elevation: 5, // Add elevation if needed
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                      ),
                      fixedSize: const Size.fromHeight(50.0), // Adjust the height as needed
                    ),
                    child: Text(
                      'Visitor no : $count',
                      style: const TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  );
                },
              ),
              SizedBox(
                width: isLengthGreaterThanWidth ? 20 : 60,
              )
            ],
            title: isLengthGreaterThanWidth
                ? null
                : const Text("Aadarsh Verma", style: TextStyle(fontSize: 25) //_appBarFontSize(width, height)),
                    )),
        floatingActionButton: BlocBuilder<ScrollToTopCubit, bool>(
          builder: (context, showScrollToTop) {
            return showScrollToTop
                ? Container(
                    height: isLengthGreaterThanWidth ? 70 : 80,
                    width: isLengthGreaterThanWidth ? 70 : 80,
                    margin: const EdgeInsets.only(bottom: 25, right: 25),
                    child: FloatingActionButton(
                      onPressed: _scrollToTop,
                      backgroundColor: Colors.greenAccent,
                      child: const Icon(
                        Icons.arrow_upward,
                        size: 30,
                      ),
                    ),
                  )
                : Container();
          },
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                HomeLandingPage(onViewProjectsPressed: _scrollToProjects),
                const AboutMePage(),
                ProjectPageMain(sectionKey: _projectsSectionKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
