import 'package:flutter/material.dart';


class ProjectPageProvider extends ChangeNotifier {
  double opacity = 1;

  ProjectPageProvider(BuildContext context) {
    _loadImages(context);
  }

  Future<void> _loadImages(BuildContext context) async {
    // for (var project in projects) {
    //   await precacheImage(
    //     project.image.image,
    //     context,
    //   );
    // }
    // notifyListeners();
  }

  void toggleFade() {
    if (opacity == 1) {
      opacity = 0.5;
      notifyListeners();
      return;
    }
    opacity = 1;
    notifyListeners();
    return;
  }
}
