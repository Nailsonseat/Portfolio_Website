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

class AcharyaSetu extends StatelessWidget {
  AcharyaSetu({super.key});


  final List<TableOfContentsComponent> projectComponents = [
    TableOfContentsComponent(title: "Description", subComponents: []),
    TableOfContentsComponent(title: "TechStack", subComponents: []),
    TableOfContentsComponent(title: "Under Construction", subComponents: []),
  ];
  final List<TextSection> textSections = [
    TextSection(title: "Description", bodyPath: 'lib/pages/projects/acharya_setu/description.html'),
    TextSection(title: "Techstack", bodyPath: 'lib/pages/projects/acharya_setu/techstack.html'),
    TextSection(title: "Under Construction...", bodyPath: 'lib/pages/templates/under_construction_template.html')
  ];

  final List<IconData> timelineIcons = [
    Ionicons.bookmark_sharp,
    EvaIcons.fileText,
    LineIcons.toolbox,
    LineIcons.tools,
    LineIcons.hardHat,
    LineIcons.hardHat,
  ];

  final Color secondaryColor = HexColor('#ebddff');

  final Color primaryColor = Colors.deepPurpleAccent[100]!;

  @override
  Widget build(BuildContext context) {

    ProjectPageProvider projectPageProvider = Provider.of<ProjectPageProvider>(context, listen: false);
    Project project = projectPageProvider.getProject("Acharya Setu");

    return ProjectPageTemplate(
      projectTitle: project.title,
      bannerImage: "lib/assets/images/project_banners/acharya_setu.jpg",
      textSections: textSections,
      timelineIcons: timelineIcons,
      secondaryColor: secondaryColor,
      primaryColor: primaryColor,
      tableOfContents: projectComponents,
    );
  }
}
