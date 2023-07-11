import 'package:flutter/material.dart';

class ProjectSliderProvider extends ChangeNotifier {
  int value = 0;

  final List<String> options = ["All projects", "Software development", "Machine Learning"];

  Future<void> onChanged(int selectedValue, Function toggleFade) async {
    toggleFade();
    return Future.delayed(const Duration(milliseconds: 1400), () {
      value = selectedValue;
      toggleFade();
      notifyListeners();
    });
  }

  Center optionBuilder(int value, double width) {
    return Center(
      child: Text(
        options[value],
        style: TextStyle(fontSize: width / 98.7),
      ),
    );
  }

  Color optionColor(int selectedValue) {
    switch (selectedValue) {
      case 0:
        return Colors.tealAccent;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.lightBlueAccent;
    }
    return Colors.transparent;
  }
}
