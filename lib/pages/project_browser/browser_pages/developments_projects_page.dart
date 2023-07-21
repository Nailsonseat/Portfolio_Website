import 'package:flutter/material.dart';
import 'package:portfolio_website/providers/project_page_provider.dart';
import 'package:provider/provider.dart';

class DevelopmentProjectsPage extends StatelessWidget {
  const DevelopmentProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectPageProvider>(
      builder: (_, projectPageProvider, __) {
        return Opacity(
          opacity: projectPageProvider.opacity,
          child: SizedBox.expand(
            child: Container(
              width: 1000,
              height: 900,
              padding: const EdgeInsets.all(100),
              child: Image.asset("lib/assets/images/miscellaneous/under_construction.png"),
            ),
          ),
        );
      },
    );
  }
}
