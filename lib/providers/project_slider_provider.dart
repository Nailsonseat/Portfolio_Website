import 'package:flutter/material.dart';

class ProjectSliderProvider extends ChangeNotifier {
  int value = 0;

  final List<String> options = ["All projects", "Software development", "Machine Learning"];

  Future<void> onChanged(int selectedValue) async {
    return Future.delayed(const Duration(seconds: 1), () {
      value = selectedValue;
      notifyListeners();
    });
  }

  Center optionBuilder(int value, Size size) {
    return Center(
      child: Text(
        options[value],
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Color optionColor(int selectedValue) {

    switch(selectedValue){
      case 0: return Colors.tealAccent;
      case 1: return Colors.orange;
      case 2: return Colors.lightBlueAccent;
    }
    return Colors.transparent;
  }
}