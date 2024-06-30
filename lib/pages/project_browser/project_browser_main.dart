import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/pages/project_browser/project_browser_page.dart';
import 'package:portfolio_website/providers/project_page_provider.dart';
import 'package:portfolio_website/providers/project_slider_provider.dart';
import 'package:provider/provider.dart';
import '../../providers/scroll_provider.dart';

class ProjectPageMain extends StatelessWidget {
  const ProjectPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width = width < 1200 ? 1200 : width;

    ProjectPageProvider projectPageProvider = Provider.of<ProjectPageProvider>(context, listen: false);

    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;

    if (isLengthGreaterThanWidth) {
      width = 455;
    }

    ScrollProvider scrollProvider = Provider.of<ScrollProvider>(context, listen: false);

    return Container(
      width: width,
      padding: EdgeInsets.only(top: isLengthGreaterThanWidth ? 0 : 50, bottom: 50),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              key: scrollProvider.scrollKeyHomePage,
              padding: EdgeInsets.only(left: isLengthGreaterThanWidth ? 50 : 150),
              child: const Text(
                "Projects",
                style: TextStyle(fontSize: 60),
              ),
            ),
            SizedBox(
              height: isLengthGreaterThanWidth ? 10 : 50,
            ),
            if (!isLengthGreaterThanWidth)
              Padding(
                padding: EdgeInsets.only(left: isLengthGreaterThanWidth ? 50 : width / 13.16),
                child: Consumer<ProjectSliderProvider>(
                  builder: (_, sliderProvider, __) {
                    return AnimatedToggleSwitch<int>.size(
                      height: isLengthGreaterThanWidth ? 50 : 80,
                      current: sliderProvider.value,
                      borderColorBuilder: (i) => Colors.black,
                      values: List<int>.generate(sliderProvider.options.length, (i) => i),
                      iconOpacity: 0.75,
                      loadingIconBuilder: (_, __) => SizedBox(
                        width: width / 65.8,
                        height: width / 65.8,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: width / 493.5,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(50),
                      indicatorSize: Size.fromWidth(isLengthGreaterThanWidth ? 120 : 300),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 2.0,
                        ),
                      ],
                      iconAnimationType: AnimationType.onHover,
                      indicatorAnimationType: AnimationType.onHover,
                      iconBuilder: (value, size) =>
                          sliderProvider.optionBuilder(value, width, isLengthGreaterThanWidth),
                      borderWidth: 0.1,
                      borderColor: Colors.transparent,
                      colorBuilder: (i) => sliderProvider.optionColor(i),
                      onChanged: (i) => sliderProvider.onChanged(i, projectPageProvider.toggleFade),
                    );
                  },
                ),
              ),
            const SizedBox(height: 50),
            IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(horizontal: isLengthGreaterThanWidth ? 30 : 90),
                padding: EdgeInsets.only(
                  top: isLengthGreaterThanWidth ? 30 : 100,
                  bottom: isLengthGreaterThanWidth ? 0 : 100,
                ),
                child: const ProjectPageBrowser(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
