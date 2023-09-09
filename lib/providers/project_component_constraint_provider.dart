import 'package:flutter/material.dart';

class ProjectComponentsConstraintsProvider extends ChangeNotifier {
  late List<GlobalKey> textKeys;
  late List<GlobalKey> titleKeys;
  late List<double> textContainerHeights;
  late List<double> titleContainerHeights;

  bool visible = false;

  void initHeights(int len) {
    textContainerHeights = List.generate(len, (index) => 0.1);
    titleContainerHeights = List.generate(len, (index) => 0);
  }

  void setTextContainerHeight() {
    for (int i = 0; i < textKeys.length; i++) {
      RenderBox textContainerRenderer = textKeys[i].currentContext!.findRenderObject() as RenderBox;
      textContainerHeights[i] = textContainerRenderer.size.height;
    }
    notifyListeners();
  }
}