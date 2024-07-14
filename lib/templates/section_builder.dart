import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_audio/flutter_html_audio.dart';
import 'package:flutter_html_iframe/flutter_html_iframe.dart';
import 'package:flutter_html_svg/flutter_html_svg.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_html_video/flutter_html_video.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_website/providers/project_component_constraint_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/projects/pdf_section.dart';
import '../components/projects/text_section.dart';
import '../components/projects/youtube_section.dart';

void _redirect(String link) async {
  try {
    if (!await launchUrl(Uri.parse(link))) {
      throw ('Error launching url');
    }
  } catch (error) {
    Logger().e(error);
  }
}

Future<String> _loadHtmlFile(String path) async => await rootBundle.loadString(path);

List<Container> buildSections(
    {required List sections,
    required ProjectComponentsConstraintsProvider componentsConstraintsProvider,
    required bool isLengthGreaterThanWidth,
    required Color sectionBoxColor}) {
  List<Container> builtSections = [];
  for (int i = 0; i < sections.length; i++) {
    builtSections.add(
      Container(
        margin: EdgeInsets.symmetric(horizontal: isLengthGreaterThanWidth ? 30 : 56), //width / 35.74), // 56
        alignment: Alignment.centerLeft,
        key: componentsConstraintsProvider.titleKeys[i],
        child: SelectableText(
          sections[i].title,
          style: TextStyle(fontSize: isLengthGreaterThanWidth ? 35 : 55), //width / 35.890909), // 55
        ),
      ),
    );
    if (sections[i] is HtmlSection) {
      builtSections.add(
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
              vertical: isLengthGreaterThanWidth ? 20 : 60, horizontal: isLengthGreaterThanWidth ? 30 : 56),
          // width / 35.74),
          padding: isLengthGreaterThanWidth ? const EdgeInsets.all(40) : const EdgeInsets.all(80),
          //width / 24.675),
          decoration: BoxDecoration(color: sectionBoxColor, borderRadius: BorderRadius.circular(30)),
          child: FutureBuilder<String>(
            future: _loadHtmlFile(sections[i].bodyPath),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Consumer<ProjectComponentsConstraintsProvider>(
                  builder: (context, provider, _) {
                    return SizedBox(
                      height: provider.textContainerHeights[i], // Replace with the height from your provider
                      child: Html(
                        data: snapshot.data,
                        style: {
                          "body": Style(
                            fontSize: isLengthGreaterThanWidth ? FontSize(12) : FontSize(19.78),
                          ),
                          //FontSize(width / 100)), // Adjust the font size as needed
                          ".techstack": Style(
                              height: Height(80), //width / 24.966667),
                              width: Width(80), //width / 24.966667),
                              margin: Margins.only(right: 20)),
                          ".techstack-small": Style(
                              height: Height(92), //width / 21.4307),
                              width: Width(92), //width / 21.4307),
                              margin: Margins.only(right: 20)),
                          ".portrait-img": Style(
                            height: Height(700), //width / 2.8257),
                            margin: Margins.only(right: 90), //width / 21.97778),
                          ),
                          ".old-new": Style(
                            padding: HtmlPaddings.only(
                              left: 56, //width / 35,
                              right: 56, //width / 35,
                              bottom: 40,
                            ),
                          ),
                          ".demo-img": Style(
                            height: Height(700), //width / 2.825714),
                          ),
                          ".center": Style(
                            textAlign: TextAlign.center,
                            margin: Margins(left: Margin.auto(), right: Margin.auto()),
                            display: Display.block,
                          ),
                        },
                        onAnchorTap: (String? url, _, __) => _redirect(url!),
                        extensions: [
                          const VideoHtmlExtension(),
                          const AudioHtmlExtension(),
                          const IframeHtmlExtension(),
                          const TableHtmlExtension(),
                          const SvgHtmlExtension(),
                          TagWrapExtension(
                            tagsToWrap: {"body"},
                            builder: (child) {
                              return Container(
                                key: componentsConstraintsProvider.sectionKeys[i],
                                child: child,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error loading HTML file'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      );
    } else if (sections[i] is YoutubeSection) {
      builtSections.add(
        Container(
          margin: EdgeInsets.symmetric(
              vertical: isLengthGreaterThanWidth ? 20 : 60, horizontal: isLengthGreaterThanWidth ? 30 : 56),
          // width / 35.74),
          padding: isLengthGreaterThanWidth ? const EdgeInsets.all(40) : const EdgeInsets.all(80),
          //width / 24.675),
          decoration: BoxDecoration(color: sectionBoxColor, borderRadius: BorderRadius.circular(30)),
          child: sections[i],
        ),
      );
    } else if (sections[i] is PDFSection) {
      builtSections.add(
        Container(
          margin: EdgeInsets.symmetric(
              vertical: isLengthGreaterThanWidth ? 20 : 60, horizontal: isLengthGreaterThanWidth ? 30 : 56),
          // width / 35.74),
          padding: isLengthGreaterThanWidth ? const EdgeInsets.all(40) : const EdgeInsets.all(80),
          //width / 24.675),
          decoration: BoxDecoration(color: sectionBoxColor, borderRadius: BorderRadius.circular(30)),
          child: sections[i],
        ),
      );
    }
  }
  return builtSections;
}
