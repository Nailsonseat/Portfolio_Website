import 'package:flutter/material.dart';

class MLProjectsPage extends StatelessWidget {
  const MLProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        width: 1000,
        height: 900,
        padding: const EdgeInsets.all(100),
        child: Image.asset("lib/assets/images/miscellaneous/under_construction.png"),
      ),
    );
  }
}
