import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:portfolio_website/components/projects/text_section.dart';
import 'package:portfolio_website/pages/project_page/project_page_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/project_page_provider.dart';

class MachineLearning extends StatelessWidget {
  MachineLearning({super.key});

  final List<TextSection> textSections = [
    TextSection(title: "Description", bodyPath: "This is a project for machine learning"),
    TextSection(title: "Description", bodyPath: "This is a project"),
  ];
  final List<ProjectComponent> projectComponents = [ProjectComponent(title: "Description", subComponents: [])];

  @override
  Widget build(BuildContext context) {
    ProjectPageProvider projectPageProvider = Provider.of<ProjectPageProvider>(context, listen: false);
    Project project = projectPageProvider.getProject("Machine Learning");
    return ProjectPageTemplate(
      projectTitle: project.title,
      bannerImage: "lib/assets/images/project_images/machine_learning.png",
      textSections: textSections,
      projectComponents: projectComponents,
    );
  }
}