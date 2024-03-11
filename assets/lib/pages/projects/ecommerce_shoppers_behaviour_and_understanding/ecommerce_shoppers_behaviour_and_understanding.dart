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

class EcommerceShoppersBehaviourAndUnderstanding extends StatelessWidget {
  EcommerceShoppersBehaviourAndUnderstanding({super.key});

  final List<TextSection> textSections = [
    TextSection(
        title: "Description",
        bodyPath: "lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/description.html"),
    TextSection(
        title: "Techstack",
        bodyPath: "lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/techstack.html"),
    TextSection(
        title: "Classifiers Used",
        bodyPath: "lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/models.html"),
    TextSection(
        title: "Results",
        bodyPath: "lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/results.html"),
  ];
  final List<TableOfContentsComponent> projectComponents = [
    TableOfContentsComponent(title: "Description", subComponents: []),
    TableOfContentsComponent(title: "Techstack", subComponents: []),
    TableOfContentsComponent(title: "Classifiers Used", subComponents: []),
    TableOfContentsComponent(title: "Results", subComponents: []),
  ];

  final List<IconData> timelineIcons = [
    Ionicons.bookmark_sharp,
    EvaIcons.fileText,
    LineIcons.toolbox,
    LineIcons.tools,
    EvaIcons.cubeOutline,
    Ionicons.funnel_outline,
    Ionicons.receipt_outline,
    Ionicons.bar_chart_outline,
  ];

  final Color secondaryColor = HexColor('#d7eff1');

  final Color primaryColor = HexColor('#25bcb8');

  @override
  Widget build(BuildContext context) {
    ProjectPageProvider projectPageProvider = Provider.of<ProjectPageProvider>(context, listen: false);
    Project project = projectPageProvider.getProject("E-commerce Shopper's Behaviour Understanding");
    return ProjectPageTemplate(
      projectTitle: project.title,
      bannerImage: "lib/assets/images/project_banners/e_commerce_behaviour_understanding.png",
      textSections: textSections,
      timelineIcons: timelineIcons,
      secondaryColor: secondaryColor,
      primaryColor: primaryColor,
      tableOfContents: projectComponents,
    );
  }
}
