import 'package:flutter/material.dart';


class ProjectSliderProvider extends ChangeNotifier {
  int value = 0;

  List<String> options = ["All projects", "Software development", "Machine Learning"];

}