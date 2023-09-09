import 'package:flutter/material.dart';

class ProjectComponentsConstraintsProvider extends ChangeNotifier {
  late List<GlobalKey> textKeys;
  late List<GlobalKey> titleKeys;
  late List<double> textContainerHeights;
  late List<double> titleContainerHeights;

  bool visible = false;

  void initHeights(int len){
    textContainerHeights = List.generate(len, (index) => 0.1);
  }
  void setHeight(double height,int index){
    textContainerHeights[index]=height;
    notifyListeners();
  }
}