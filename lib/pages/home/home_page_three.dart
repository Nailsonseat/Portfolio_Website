
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

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
          AnimatedToggleSwitch<int>.size(
            current: value,
            values: const [0, 1, 2, 3],
            iconOpacity: 0.2,
            borderRadius: BorderRadius.circular(50),
            indicatorSize: Size(width = 100,height = double.infinity),
            iconAnimationType: AnimationType.onHover,
            indicatorAnimationType: AnimationType.onHover,
            iconBuilder: (value, size) {
              return Center(child: Text('Hello',style: TextStyle(fontSize: 20),));
            },
            borderWidth: 0.0,
            borderColor: Colors.transparent,
            colorBuilder: (i) => i.isEven == true ? Colors.amber : Colors.red,
            onChanged: (i) {
              return Future.delayed(Duration(seconds: 1));
            },
          ),
        ],
      ),
    );
  }
}
