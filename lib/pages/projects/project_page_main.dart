import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/pages/projects/project_page_browser.dart';
import 'package:portfolio_website/providers/project_page_provider.dart';
import 'package:portfolio_website/providers/project_slider_provider.dart';
import 'package:provider/provider.dart';

class HomePageThree extends StatelessWidget {
  const HomePageThree({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width = width < 800 ? 800 : width;

    ProjectPageProvider projectPageProvider = Provider.of<ProjectPageProvider>(context, listen: false);

    return Container(
      width: width,
      padding: const EdgeInsets.only(top: 50, bottom: 50),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 150),
              child: Text(
                "Projects",
                style: TextStyle(fontSize: 60),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Consumer<ProjectSliderProvider>(
                builder: (_, sliderProvider, __) {
                  return AnimatedToggleSwitch<int>.size(
                    height: 80,
                    current: sliderProvider.value,
                    borderColorBuilder: (i) => Colors.black,
                    values: List<int>.generate(sliderProvider.options.length, (i) => i),
                    iconOpacity: 0.75,
                    borderRadius: BorderRadius.circular(50),
                    indicatorSize: const Size.fromWidth(300),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 0),
                        blurRadius: 2.0,
                      ),
                    ],
                    iconAnimationType: AnimationType.onHover,
                    indicatorAnimationType: AnimationType.onHover,
                    iconBuilder: (value, size) => sliderProvider.optionBuilder(value, size),
                    borderWidth: 0.1,
                    borderColor: Colors.transparent,
                    colorBuilder: (i) => sliderProvider.optionColor(i),
                    onChanged: (i) => sliderProvider.onChanged(i, projectPageProvider.toggleFade),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.symmetric(horizontal: 90),
                padding: const EdgeInsets.only(top: 100, bottom: 100),
                child: const ProjectPageBrowser(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}