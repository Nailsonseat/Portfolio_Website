import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portfolio_website/pages/templates/project_page_template.dart';
import 'package:provider/provider.dart';

import '../../../components/projects/project_component.dart';
import '../../../components/projects/text_section.dart';
import '../../../providers/project_page_provider.dart';

class FossOverflow extends StatelessWidget {
  const FossOverflow({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectPageProvider projectPageProvider = Provider.of<ProjectPageProvider>(context, listen: false);
    Project project = projectPageProvider.getProject("FOSS Overflow");

    final List<TableOfContentsComponent> projectComponents = [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "Mentors", subComponents: []),
      TableOfContentsComponent(title: "TechStack", subComponents: []),
      TableOfContentsComponent(title: "Authentication", subComponents: []),
      TableOfContentsComponent(title: "Database & Storage", subComponents: []),
      TableOfContentsComponent(title: "Admin Role", subComponents: []),
      TableOfContentsComponent(title: "User Features", subComponents: []),
      TableOfContentsComponent(title: "Conclusion", subComponents: []),
    ];

    final List<TextSection> textSections = [
      TextSection(title: "Description", bodyPath: 'lib/pages/projects/foss_overflow/description.html'),
      TextSection(title: "Mentors", bodyPath: 'lib/pages/projects/foss_overflow/mentors.html'),
      TextSection(title: "Tech Stack", bodyPath: 'lib/pages/projects/foss_overflow/techstack.html'),
      TextSection(title: "Authentication", bodyPath: 'lib/pages/projects/foss_overflow/authentication.html'),
      TextSection(title: "Database and Storage", bodyPath: 'lib/pages/projects/foss_overflow/database_storage.html'),
      TextSection(title: "Admin Role", bodyPath: 'lib/pages/projects/foss_overflow/admin.html'),
      TextSection(title: "User Features", bodyPath: 'lib/pages/projects/foss_overflow/features.html'),
      TextSection(title: "Conclusion", bodyPath: 'lib/pages/projects/foss_overflow/conclusion.html'),
    ];

    final List<IconData> timelineIcons = [
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
    ];

    final Color secondaryColor = HexColor('#c3dbf7');

    final Color primaryColor = HexColor('#4075e6');

    return ProjectPageTemplate(
        projectTitle: project.title,
        bannerImage: "lib/assets/images/project_banners/foss_overflow.png",
        textSections: textSections,
        tableOfContents: projectComponents,
        timelineIcons: timelineIcons,
        secondaryColor: secondaryColor,
        primaryColor: primaryColor);
  }
}
