import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/providers/project_slider_provider.dart';
import 'package:provider/provider.dart';

class HomePageThree extends StatelessWidget {
  const HomePageThree({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    width = width < 800 ? 800 : width;

    return Container(
      width: width,
      height: height * 2.5 - 80,
      padding: EdgeInsets.only(top: 50, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Text(
              "Projects",
              style: TextStyle(fontSize: 60),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 150),
            child: Consumer<ProjectSliderProvider>(
              builder: (_, sliderProvider, __) {
                return AnimatedToggleSwitch<int>.size(
                  height: 80,
                  current: sliderProvider.value,
                  borderColorBuilder: (i) => Colors.black,
                  values: List<int>.generate(sliderProvider.options.length, (i) => i),
                  iconOpacity: 0.75,
                  borderRadius: BorderRadius.circular(50),
                  indicatorSize: Size.fromWidth(300),
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
                  onChanged: (i) => sliderProvider.onChanged(i),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          IntrinsicHeight(
            child: Container(
              //height: height * 1.5,
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 90),
              padding: const EdgeInsets.only(top: 100, bottom: 100),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 1.0, // Adjust the opacity value to control the level of fading
                    child: SizedBox.expand(
                      child: Wrap(
                        alignment: WrapAlignment.spaceAround,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.spaceEvenly,
                        runSpacing: 50,
                        children: [
                          SizedBox(
                            width: 500,
                            height: 650,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
                                      child: Image.asset(
                                        'lib/assets/images/project_images/acharya_setu.jpg',
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Text("Aharya Setu",style: TextStyle(fontSize: 35),),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 450,
                            height: 500,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
                            ),
                          ),
                          SizedBox(
                            width: 450,
                            height: 500,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
                            ),
                          ),
                          SizedBox(
                            width: 450,
                            height: 500,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
                            ),
                          ),
                          SizedBox(
                            width: 450,
                            height: 500,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
                            ),
                          ),
                          SizedBox(
                            width: 450,
                            height: 500,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
                            ),
                          ),
                          SizedBox(
                            width: 450,
                            height: 500,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
