import 'package:flutter/material.dart';
import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:provider/provider.dart';
import '../../providers/project_component_constraint_provider.dart';
import '../../providers/scroll_provider.dart';


class TableOfContents extends StatelessWidget {
  const TableOfContents({super.key, required this.tableOfContents, required this.fontColor});

  final List<TableOfContentsComponent> tableOfContents;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {

    ScrollProvider scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    ProjectComponentsConstraintsProvider componentsConstraintsProvider =
    Provider.of<ProjectComponentsConstraintsProvider>(context, listen: false);

    List<Widget> contents = [];
    double bannerHeight =
        scrollProvider.bannerHeight + scrollProvider.width / 13.16; // banner height + the first space of 150 pixels
    double textSectionMargin = 60 * 2;
    double textSectionPadding = (scrollProvider.width / 24.675) * 2;
    for (int i = 0; i < tableOfContents.length; i++) {
      double extraHeight = 0;
      int n = i;
      while (n > 0) {
        extraHeight += componentsConstraintsProvider.titleContainerHeights[n - 1] +
            componentsConstraintsProvider.textContainerHeights[n - 1] +
            textSectionMargin +
            textSectionPadding;
        n--;
      }
      contents.addAll([
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                ),
              ),
            ),
            onPressed: () {
              scrollProvider.scrollToProjectDescription(bannerHeight + extraHeight);
            },
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: fontColor,
                  size: 16,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  tableOfContents[i].title,
                  style: TextStyle(fontSize: 26, color: fontColor),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 10,
          indent: 80,
          endIndent: 80,
          color: fontColor,
        )
      ]);
      for (String j in tableOfContents[i].subComponents) {
        contents.addAll([
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                color: fontColor,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    j,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 2,
          ),
        ]);
      }
    }

    return Column(
      children: contents,
    );
  }
}
