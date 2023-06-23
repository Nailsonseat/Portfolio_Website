import 'dart:async';
import 'package:flutter/material.dart';

class LaunchPageProvider extends ChangeNotifier {
  double percent = 0.33;

  void startAnimation() {
    Timer.periodic(
      const Duration(milliseconds: 3000),
      (Timer timer) {
        if (percent < 0.666) {
          percent = 0.666;
        } else {
          percent = 1.0;
          timer.cancel();
        }
        notifyListeners();
      }
    );
  }
}