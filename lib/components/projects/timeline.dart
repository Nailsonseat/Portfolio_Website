import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class ProjectTimeLine extends StatelessWidget {
  const ProjectTimeLine(
      {super.key, required this.sections, required this.timelineIcons, required this.timelineBlockColor});

  final List<Widget> sections;
  final List<IconData> timelineIcons;
  final Color timelineBlockColor;

  @override
  Widget build(BuildContext context) {
    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;
    final int length = sections.length;
    if (isLengthGreaterThanWidth) {
      return Column(
        children: [
          for (int i = 0; i < length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: sections[i],
            ),
        ],
      );
    }
    return FixedTimeline.tileBuilder(
      theme: TimelineTheme.of(context).copyWith(
        nodePosition: 0,
      ),
      builder: TimelineTileBuilder.connected(
        contentsAlign: ContentsAlign.basic,
        connectorBuilder: (context, index, type) {
          if (length > 1 && index == length - 2) {
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
                color: timelineBlockColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(timelineIcons[index], color: Colors.white, size: 32),
            ),
          );
        },
        contentsBuilder: (context, index) => sections[index],
        itemCount: length,
      ),
    );
  }
}
