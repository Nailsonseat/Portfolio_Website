import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timelines/timelines.dart';

class ProjectTimeLine extends StatelessWidget {
  const ProjectTimeLine({super.key, required this.textSections});

  final List<Widget> textSections;

  @override
  Widget build(BuildContext context) {
    final int length = textSections.length;
    return FixedTimeline.tileBuilder(
      theme: TimelineTheme.of(context).copyWith(
        nodePosition: 0,
      ),
      builder: TimelineTileBuilder.connected(
        contentsAlign: ContentsAlign.basic,
        connectorBuilder: (context, index, type) {
          if (index == 2) {
            return const DashedLineConnector(
              thickness: 3,
              gap: 6,
              color: Colors.black,
            );
          }
          return const SolidLineConnector(
            color: Colors.black,
          );
        },
        indicatorBuilder: (context, index) {
          return ContainerIndicator(
            child: Container(
              width: 70,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[100],
                borderRadius: BorderRadius.circular(20),
                // border: Border.all(color: Colors.lightBlueAccent)
              ),
              child: const Icon(EvaIcons.fileText, color: Colors.white, size: 32),
            ),
          );
        },
        contentsBuilder: (context, index) => textSections[index],
        itemCount: length,
      ),
    );
  }
}
