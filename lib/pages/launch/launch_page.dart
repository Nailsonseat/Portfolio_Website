import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio_website/providers/launch_page_animation_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LaunchPageProvider>(context, listen: false).startAnimation();
    });

    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;

    if (isLengthGreaterThanWidth) {
      double width = 455;
      return ResponsiveScaledBox(
        width: width,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 80),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start  ,
                  children: [
                    const AutoSizeText(
                      'Hello!',
                      style: TextStyle(fontSize: 30, fontFamily: 'Quicksand'),
                      minFontSize: 15,
                    ),
                    Row(
                      children: [
                        const AutoSizeText(
                          'My name is Aadarsh',
                          style: TextStyle(fontSize: 30, fontFamily: 'Quicksand'),
                          minFontSize: 15,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TyperAnimatedText(
                                "...",
                                textStyle: const TextStyle(fontSize: 30, fontFamily: 'Quicksand'),
                                speed: const Duration(milliseconds: 500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      width: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const AutoSizeText(
                            'I do ',
                            style: TextStyle(fontSize: 22, fontFamily: 'Quicksand'),
                            minFontSize: 20,
                          ),
                          AnimatedTextKit(
                            onFinished: () {
                              Provider.of<LaunchPageProvider>(context, listen: false)
                                  .incrementVisitorCount();
                                context.go('/home');
                            },
                            repeatForever: false,
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              RotateAnimatedText(
                                'Development',
                                textStyle: const TextStyle(fontSize: 22, fontFamily: 'Quicksand'),
                                transitionHeight: 40,
                              ),
                              RotateAnimatedText('Machine Learning',
                                  textStyle: const TextStyle(fontSize: 22, fontFamily: 'Quicksand'),
                                  transitionHeight: 40),
                              RotateAnimatedText('both!',
                                  rotateOut: false,
                                  textStyle: const TextStyle(fontSize: 22, fontFamily: 'Quicksand'),
                                  transitionHeight: 40,
                                  duration: const Duration(milliseconds: 500)),
                            ],
                          ),
                          const Spacer(),
                          Consumer<LaunchPageProvider>(
                            builder: (_, animationProvider, __) {
                              return CircularPercentIndicator(
                                addAutomaticKeepAlive: true,
                                radius: 25,
                                animation: true,
                                animationDuration: 1000,
                                lineWidth: 5,
                                animateFromLastPercent: true,
                                percent: animationProvider.percent,
                                circularStrokeCap: CircularStrokeCap.butt,
                                progressColor: Colors.grey[200],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      double width = 1978;
      return ResponsiveScaledBox(
        width: width,
        child: SizedBox(
          width: width,
          child: Scaffold(
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
                                child: Container(
                                  color: Colors.grey[200],
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    children: [
                                      const AutoSizeText(
                                        'Hello! My name is Aadarsh',
                                        style: TextStyle(fontSize: 60, fontFamily: 'Quicksand'),
                                        minFontSize: 15,
                                      ),
                                      AnimatedTextKit(
                                        repeatForever: true,
                                        animatedTexts: [
                                          TyperAnimatedText(
                                            "...",
                                            textStyle: const TextStyle(fontSize: 60, fontFamily: 'Quicksand'),
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
                                  Container(
                                    height: 100,
                                    color: Colors.grey[200],
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const AutoSizeText(
                                          'I do ',
                                          style: TextStyle(fontSize: 50, fontFamily: 'Quicksand'),
                                          minFontSize: 20,
                                        ),
                                        AnimatedTextKit(
                                          onFinished: () {
                                            Provider.of<LaunchPageProvider>(context, listen: false)
                                                .incrementVisitorCount();
                                              context.go('/home');
                                          },
                                          repeatForever: false,
                                          isRepeatingAnimation: false,
                                          animatedTexts: [
                                            RotateAnimatedText(
                                              'Development',
                                              textStyle: const TextStyle(fontSize: 50, fontFamily: 'Quicksand'),
                                              transitionHeight: 100,
                                            ),
                                            RotateAnimatedText('Machine Learning',
                                                textStyle: const TextStyle(fontSize: 50, fontFamily: 'Quicksand'),
                                                transitionHeight: 100),
                                            RotateAnimatedText('both!',
                                                rotateOut: false,
                                                textStyle: const TextStyle(fontSize: 50, fontFamily: 'Quicksand'),
                                                transitionHeight: 100,
                                                duration: const Duration(milliseconds: 500)),
                                          ],
                                        ),
                                      ],
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
                            radius: 60,
                            animation: true,
                            animationDuration: 1000,
                            lineWidth: 10,
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
          ),
        ),
      );
    }
  }
}
