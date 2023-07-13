import 'package:flutter/cupertino.dart';

class ScrollTopProvider extends ChangeNotifier {
  final ScrollController _homeScrollController = ScrollController();
  final ScrollController _detailedProjectScrollController = ScrollController();
  bool _showFloatingButton = false;

  late double appBarHeight;

  ScrollTopProvider() {
    _homeScrollController.addListener(_scrollListener);
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

  void scrollToTop() {
    _homeScrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToProjectDescription(double position) {
    _homeScrollController.animateTo(
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