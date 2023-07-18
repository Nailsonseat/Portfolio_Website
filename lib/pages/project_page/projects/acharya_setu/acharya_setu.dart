import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:portfolio_website/components/projects/text_section.dart';
import 'package:portfolio_website/pages/project_page/project_page_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/project_page_provider.dart';

class AcharyaSetu extends StatelessWidget {
  const AcharyaSetu({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectPageProvider projectPageProvider = Provider.of<ProjectPageProvider>(context, listen: false);
    Project project = projectPageProvider.getProject("Acharya Setu");

    final List<ProjectComponent> projectComponents = [ProjectComponent(title: "Description", subComponents: [])];
    final List<TextSection> textSections = [
      TextSection(title: "Description", bodyPath: 'lib/pages/project_page/projects/acharya_setu/description.html')
    ];

    return ProjectPageTemplate(
      projectTitle: project.title,
      bannerImage: "lib/assets/images/project_images/acharya_setu.jpg",
      textSections: textSections,
      projectComponents: projectComponents,
    );
  }
}
