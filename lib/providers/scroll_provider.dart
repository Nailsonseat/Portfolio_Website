import 'package:flutter/cupertino.dart';

class ScrollTopProvider extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();
  bool _showFloatingButton = false;

  late double appBarHeight;

  ScrollTopProvider() {
    _scrollController.addListener(_scrollListener);
  }

  ScrollController get scrollController => _scrollController;

  bool get showFloatingButton => _showFloatingButton;

  void _scrollListener() {
    if (_scrollController.offset >= 100) {
      _showFloatingButton = true;
    } else {
      _showFloatingButton = false;
    }
    notifyListeners();
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToProjects(double singlePageHeight) {
    _scrollController.animateTo(
      (singlePageHeight * 2) - appBarHeight,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}