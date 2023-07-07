import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/project_page_provider.dart';



class AllProjectsPage extends StatelessWidget {
  const AllProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectPageProvider>(
      builder: (_, projectProvider, __) {
        return Opacity(
          opacity: projectProvider.opacity, // Adjust the opacity value to control the level of fading
          child: SizedBox.expand(
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.spaceEvenly,
              runSpacing: 80,
              children: [
                for (Project i in projectProvider.projects)
                  SizedBox(
                    width: 500,
                    height: 650,
                    child: Container(
                      decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                            child: i.image,
                          ),
                          Align(
                            heightFactor: 2,
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                i.title,
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              i.briefDescription,
                              style: const TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
