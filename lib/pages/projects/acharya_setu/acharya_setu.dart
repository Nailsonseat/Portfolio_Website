import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:portfolio_website/components/projects/text_section.dart';
import 'package:portfolio_website/pages/templates/project_page_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/project_page_provider.dart';

class AcharyaSetu extends StatelessWidget {
  const AcharyaSetu({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectPageProvider projectPageProvider = Provider.of<ProjectPageProvider>(context, listen: false);
    Project project = projectPageProvider.getProject("Acharya Setu");

    final List<ProjectComponent> projectComponents = [ProjectComponent(title: "Description", subComponents: [])];
    final List<TextSection> textSections = [
      TextSection(title: "Description", bodyPath: 'lib/pages/projects/acharya_setu/description.html'),
      TextSection(title: "Under Construction...", bodyPath: 'lib/pages/projects/templates/under_construction_template.html')
    ];

    final List<IconData> timelineIcons = [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      Ionicons.construct_outline,
      LineIcons.hardHat
    ];

    final Color containerColor = Colors.deepPurpleAccent[100]!.withOpacity(0.2);

    final Color timelineBlockColor = Colors.deepPurpleAccent[100]!;

    return ProjectPageTemplate(
      projectTitle: project.title,
      bannerImage: "lib/assets/images/project_images/acharya_setu.jpg",
      textSections: textSections,
      timelineIcons: timelineIcons,
      containerColor: containerColor,
      timelineBlockColor: timelineBlockColor,
      projectComponents: projectComponents,
    );
  }
}
