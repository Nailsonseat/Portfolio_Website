import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:portfolio_website/components/projects/text_section.dart';
import 'package:portfolio_website/pages/templates/project_page_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/project_page_provider.dart';

class ONDCBuildForBharat extends StatelessWidget {
  ONDCBuildForBharat({super.key});

  final List<TextSection> textSections = [
    TextSection(title: "Description", bodyPath: "lib/pages/projects/ondc_build_for_bharat/description.html"),
    TextSection(title: "Conditions", bodyPath: "lib/pages/projects/ondc_build_for_bharat/conditions.html"),
    TextSection(title: "Team", bodyPath: "lib/pages/projects/ondc_build_for_bharat/team.html"),
    TextSection(title: "Project", bodyPath: "lib/pages/projects/ondc_build_for_bharat/project.html"),
    TextSection(title: "Conclusion", bodyPath: "lib/pages/projects/ondc_build_for_bharat/conclusion.html"),
  ];
  final List<TableOfContentsComponent> projectComponents = [
    TableOfContentsComponent(title: "Description", subComponents: []),
    TableOfContentsComponent(title: "Conditions", subComponents: []),
    TableOfContentsComponent(title: "Team", subComponents: []),
    TableOfContentsComponent(title: "Project", subComponents: []),
    TableOfContentsComponent(title: "Conclusion", subComponents: []),
  ];

  final List<IconData> timelineIcons = [
    Ionicons.bookmark_sharp,
    EvaIcons.fileText,
    EvaIcons.fileText,
    EvaIcons.fileText,
    EvaIcons.fileText,
    EvaIcons.fileText,
    EvaIcons.fileText,
    EvaIcons.fileText,
    EvaIcons.fileText,
    EvaIcons.fileText,
  ];

  final Color secondaryColor = HexColor('#e9f4ff');

  final Color primaryColor = HexColor('#8f9fef');

  @override
  Widget build(BuildContext context) {
    ProjectPageProvider projectPageProvider = Provider.of<ProjectPageProvider>(context, listen: false);
    Project project = projectPageProvider.getProject("ONDC - Build for Bharat");
    return ProjectPageTemplate(
      projectTitle: project.title,
      bannerImage: "lib/assets/images/project_banners/ondc.png",
      textSections: textSections,
      timelineIcons: timelineIcons,
      secondaryColor: secondaryColor,
      primaryColor: primaryColor,
      tableOfContents: projectComponents,
    );
  }
}
