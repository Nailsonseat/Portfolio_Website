import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:provider/provider.dart';
import '../../providers/project_component_constraint_provider.dart';

class TableOfContents extends StatelessWidget {
  const TableOfContents({super.key, required this.tableOfContents, required this.fontColor});

  final List<TableOfContentsComponent> tableOfContents;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    ProjectComponentsConstraintsProvider componentsConstraintsProvider =
        Provider.of<ProjectComponentsConstraintsProvider>(context, listen: false);

    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;

    List<Widget> contents = [];
    for (int i = 0; i < tableOfContents.length; i++) {
      contents.addAll([
        Container(
          padding: EdgeInsets.symmetric(horizontal: isLengthGreaterThanWidth ? 0 : 80),
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
              if (isLengthGreaterThanWidth) context.pop();
            },
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: fontColor,
                  size: 16,
                ),
                const SizedBox(
                  width: 20 - 5,
                ),
                Text(
                  tableOfContents[i].title,
                  style: TextStyle(fontSize: isLengthGreaterThanWidth ? 18 : 26, color: fontColor),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 10,
          indent: isLengthGreaterThanWidth ? 10 : 80,
          endIndent: isLengthGreaterThanWidth ? 10 : 80,
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
      mainAxisSize: MainAxisSize.min,
      children: contents,
    );
  }
}
