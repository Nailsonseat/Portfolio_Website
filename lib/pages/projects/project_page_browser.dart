import 'package:flutter/material.dart';
import 'package:portfolio_website/pages/projects/all_projects_page.dart';
import 'package:portfolio_website/pages/projects/developments_projects_page.dart';
import 'package:portfolio_website/pages/projects/ml_projects_page.dart';
import 'package:portfolio_website/providers/project_slider_provider.dart';
import 'package:provider/provider.dart';

class ProjectPageBrowser extends StatelessWidget {
  const ProjectPageBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectSliderProvider>(
      builder: (_, sliderProvider, __) {
        if (sliderProvider.value == 0) {
          return const AllProjectsPage();
        } else if (sliderProvider.value == 1) {
          return const DevelopmentProjectsPage();
        } else {
          return const MLProjectsPage();
        }
      },
    );
  }
}
