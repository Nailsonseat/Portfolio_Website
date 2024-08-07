import 'dart:async';
import 'package:flutter/material.dart';

class ProjectComponentsConstraintsProvider extends ChangeNotifier {
  late List<GlobalKey> sectionKeys;
  late List<GlobalKey> titleKeys;
  late List<double> textContainerHeights;
  late List<double> titleContainerHeights;
  Timer? _timer;

  bool visible = false;

  void initHeights(int len) {
    textContainerHeights = List.generate(len, (index) => 0.1);
    titleContainerHeights = List.generate(len, (index) => 0);
  }

  void startRenderTimer() {
    int count = 0;
    if (_timer != null) _timer!.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (count < 10) {
        count++;
        setTextContainerHeight(); // Notify listeners when the count changes
      } else {
        timer.cancel();
      }
    });
  }

  void setTextContainerHeight() {
    for (int i = 0; i < sectionKeys.length; i++) {
      if(sectionKeys[i].currentContext == null) continue; // Add this line to prevent null pointer exception
      RenderBox textContainerRenderer = sectionKeys[i].currentContext!.findRenderObject() as RenderBox;
      textContainerHeights[i] = textContainerRenderer.size.height;
    }
    notifyListeners();
  }
}