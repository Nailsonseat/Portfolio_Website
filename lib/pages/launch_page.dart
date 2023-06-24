import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio_website/providers/launch_page_animation_provider.dart';
import 'package:provider/provider.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LaunchPageProvider>(context, listen: false).startAnimation();
    });
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[200],
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(color: Colors.grey[200]),
                        ),
                        Expanded(
                          flex: 4,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              children: [
                                AutoSizeText(
                                  'Hello! My name is Aadarsh',
                                  style: TextStyle(fontSize: width / 33, fontFamily: 'Quicksand'),
                                  minFontSize: 15,
                                ),
                                AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      "...",
                                      textStyle: TextStyle(fontSize: width / 33, fontFamily: 'Quicksand'),
                                      speed: const Duration(milliseconds: 500),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.grey[200]),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.grey[200],
                                child: Row(
                                  children: [
                                    AutoSizeText('I do ',
                                        style: TextStyle(fontSize: width / 39.5, fontFamily: 'Quicksand'),minFontSize: 20,),
                                    AnimatedTextKit(
                                      onFinished: () => context.go('/home'),
                                      repeatForever: false,
                                      isRepeatingAnimation: false,
                                      animatedTexts: [
                                        RotateAnimatedText(
                                          'Development',
                                          textStyle: TextStyle(fontSize: width / 39.5, fontFamily: 'Quicksand'),
                                          transitionHeight: 100,
                                        ),
                                        RotateAnimatedText('Machine Learning',
                                            textStyle: TextStyle(fontSize: width / 39.5, fontFamily: 'Quicksand'),
                                            transitionHeight: 100),
                                        RotateAnimatedText('both!',
                                            rotateOut: false,
                                            textStyle: TextStyle(fontSize: width / 39.5, fontFamily: 'Quicksand'),
                                            transitionHeight: 100,
                                            duration: const Duration(milliseconds: 500)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(color: Colors.grey[200]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Align(
                alignment: Alignment.centerLeft,
                child: Consumer<LaunchPageProvider>(
                  builder: (_, animationProvider, __) {
                    return CircularPercentIndicator(
                      addAutomaticKeepAlive: true,
                      radius: width / 33,
                      animation: true,
                      animationDuration: 1000,
                      lineWidth: width / 197.4,
                      animateFromLastPercent: true,
                      percent: animationProvider.percent,
                      circularStrokeCap: CircularStrokeCap.butt,
                      progressColor: Colors.grey[200],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
