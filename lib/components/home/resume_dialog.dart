import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeDialog extends StatelessWidget {
  const ResumeDialog({super.key});

  void _redirectToResume(String link) async {
    try {
      if (!await launchUrl(Uri.parse(link))) {
        throw ('Error launching url');
      }
    } catch (error) {
      Logger().e(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;
    return Dialog(
      child: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Resumes', style: GoogleFonts.comfortaa(fontSize: isLengthGreaterThanWidth ? 30 : 50)),
              SizedBox(
                width: double.infinity,
                height: isLengthGreaterThanWidth ? 60 : 90,
                child: FilledButton.tonal(
                  onPressed: () => _redirectToResume(
                      'https://drive.google.com/file/d/1c2p5wzAOQEXowhkHVuLBzKb9YSK46nkf/view?usp=sharing'),
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(const EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Software Engineering Resume',
                          style: GoogleFonts.comfortaa(fontSize: isLengthGreaterThanWidth ? 14 : 20))),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: isLengthGreaterThanWidth ? 60 : 90,
                child: FilledButton.tonal(
                  onPressed: () => _redirectToResume(
                      'https://drive.google.com/file/d/1HRHnCNhIpIO-I6MnqFODW7WH9Y050xEN/view?usp=sharing'),
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(const EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('AI/ML/DS Resume',
                          style: GoogleFonts.comfortaa(fontSize: isLengthGreaterThanWidth ? 14 : 20))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
