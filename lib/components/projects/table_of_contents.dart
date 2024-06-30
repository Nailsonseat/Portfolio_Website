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

    double width = 1978;
    ProjectComponentsConstraintsProvider componentsConstraintsProvider =
    Provider.of<ProjectComponentsConstraintsProvider>(context, listen: false);

    List<Widget> contents = [];
    for (int i = 0; i < tableOfContents.length; i++) {
      contents.addAll([
        Container(
          padding:  EdgeInsets.symmetric(horizontal: width/24.725),
          child: TextButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                ),
              ),
            ),
            onPressed: () {
              Scrollable.ensureVisible(
                componentsConstraintsProvider.titleKeys[i].currentContext!,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                alignment: 0.05,
              );

            },
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: fontColor,
                  size: width/123.625,
                ),
                 SizedBox(
                  width: width/98.9-5,
                ),
                Text(
                  tableOfContents[i].title,
                  style: TextStyle(fontSize: width/76.07692 , color: fontColor),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 10,
          indent: width/24.725,
          endIndent: width/24.725,
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
