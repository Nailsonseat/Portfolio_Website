
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
      height: height - 50,
      padding: EdgeInsets.only(left: 150, top: 50),
      color: Colors.lightBlueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Projects",
              style: TextStyle(fontSize: 50),
            ),
          ),
          SizedBox(height: 50,),
          Consumer<ProjectSliderProvider>(
            builder: (_, sliderProvider, __) {
              return AnimatedToggleSwitch<int>.size(
                height: 80,
                current: sliderProvider.value,
                borderColorBuilder: (i) => Colors.black,
                values: List<int>.generate(sliderProvider.options.length, (i) => i),
                iconOpacity: 0.2,
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
        ],
      ),
    );
  }
}
