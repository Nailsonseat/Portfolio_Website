import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  Future<({String aboutMe, String education})> getMyInfo() async {
    String aboutMe = await rootBundle.loadString("lib/assets/text/about_me/about_me.txt");
    String education = await rootBundle.loadString("lib/assets/text/about_me/education.txt");

    aboutMe = aboutMe.replaceAll('\n', ' ');

    return (aboutMe: aboutMe, education: education);
  }

  @override
  Widget build(BuildContext context) {
    double width = 1978;

    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;

    if (isLengthGreaterThanWidth) {
      width = 455;
    }

    return Container(
      width: width,
      padding: EdgeInsets.only(top: isLengthGreaterThanWidth ? 5 : 50),
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: isLengthGreaterThanWidth ? 20 : 150, vertical: 70),
        padding: EdgeInsets.only(
          left: isLengthGreaterThanWidth ? 30 : 80,
          right: isLengthGreaterThanWidth ? 30 : 80,
          top: 30,
          bottom: 80,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectableText(
              'About me',
              style: GoogleFonts.inter(
                fontSize: isLengthGreaterThanWidth ? 30 : 55,
                decorationThickness: 0.5,
              ),
            ),
            const SizedBox(height: 40),
            IntrinsicHeight(
              child: FutureBuilder<({String aboutMe, String education})>(
                future: getMyInfo(),
                builder: (BuildContext context, AsyncSnapshot<({String aboutMe, String education})> snapshot) {
                  if (snapshot.hasData) {
                    String aboutMe = snapshot.data?.aboutMe ?? '';
                    String education = snapshot.data?.education ?? '';
                    return SelectableText(
                      aboutMe + education,
                      style: GoogleFonts.robotoMono(fontSize: isLengthGreaterThanWidth ? 12 : 20),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
