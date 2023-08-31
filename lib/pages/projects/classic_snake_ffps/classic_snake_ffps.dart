import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:portfolio_website/components/projects/text_section.dart';
import 'package:portfolio_website/pages/templates/project_page_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/project_page_provider.dart';

class ClassicSnakeFFPS extends StatelessWidget {
  ClassicSnakeFFPS({super.key});

  final List<TextSection> textSections = [
    TextSection(title: "Description", bodyPath: "lib/pages/projects/classic_snake_ffps/description.html"),
    TextSection(title: "Under Construction...", bodyPath: "lib/pages/projects/templates/under_construction_template.html"),
  ];
  final List<ProjectComponent> projectComponents = [ProjectComponent(title: "Description", subComponents: [])];

  final List<IconData> timelineIcons = [
    Ionicons.bookmark_sharp,
    EvaIcons.fileText,
    Ionicons.construct,
    LineIcons.hardHat
  ];

  final Color containerColor = HexColor('#e7f6ee');

  final Color timelineBlockColor = HexColor('#82d0a7');

  @override
  Widget build(BuildContext context) {
    ProjectPageProvider projectPageProvider = Provider.of<ProjectPageProvider>(context, listen: false);
    Project project = projectPageProvider.getProject("Classic Snake Focused Frames per Second");
    return ProjectPageTemplate(
      projectTitle: project.title,
      bannerImage: "lib/assets/images/project_images/snake.png",
      textSections: textSections,
      timelineIcons: timelineIcons,
      containerColor: containerColor,
      timelineBlockColor: timelineBlockColor,
      primaryColor: containerColor,
      projectComponents: projectComponents,
    );
  }
}