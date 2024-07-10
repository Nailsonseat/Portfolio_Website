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

  final scrollKeyHomePage = GlobalKey();

  ScrollProvider() {
    _homeScrollController.addListener(_scrollListener);
    _detailedProjectScrollController.addListener(() {
      tableOfContentsListener(bannerHeight, width);
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

  void tableOfContentsListener(double height, double width) {
    if (_detailedProjectScrollController.offset > height) {
      tableOfContentsOffset = max(0, _detailedProjectScrollController.offset - height - 50);
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

  void scrollToProjects(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0.1,
    );

  }
}
