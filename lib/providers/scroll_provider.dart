import 'dart:math';
import 'package:flutter/cupertino.dart';

class ScrollProvider extends ChangeNotifier {
  final ScrollController _homeScrollController = ScrollController();
  final ScrollController _detailedProjectScrollController = ScrollController();
  bool _showFloatingButton = false;

  late double appBarHeight;
  late double bannerHeight;
  late double width;
  double tableOfContentsOffset = 0;

  ScrollProvider() {
    _homeScrollController.addListener(_scrollListener);
    _detailedProjectScrollController.addListener(() {
      tableOfContentsListner(bannerHeight, width);
    });
  }

  ScrollController get homeScrollController => _homeScrollController;

  ScrollController get detailedProjectScrollController => _detailedProjectScrollController;

  bool get showFloatingButton => _showFloatingButton;

  void _scrollListener() {
    if (_homeScrollController.offset >= 100) {
      _showFloatingButton = true;
    } else {
      _showFloatingButton = false;
    }
    notifyListeners();
  }

  void tableOfContentsListner(double height, double width) {
    if (_detailedProjectScrollController.offset > height) {
      tableOfContentsOffset = max(0, _detailedProjectScrollController.offset - height - width / 9.87);
    } else {
      tableOfContentsOffset = 0;
    }
    notifyListeners();
  }

  void scrollToTop() {
    _homeScrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToProjectDescription(double position) {
    _detailedProjectScrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToProjects(double singlePageHeight) {
    _homeScrollController.animateTo(
      (singlePageHeight * 2) - appBarHeight,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
