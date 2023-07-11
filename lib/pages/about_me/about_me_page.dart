import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageTwo extends StatelessWidget {
  const HomePageTwo({super.key});

  Future<({String aboutMe, String education})> getMyInfo() async {
    String aboutMe = await rootBundle.loadString("lib/assets/text/about_me/about_me.txt");
    String education = await rootBundle.loadString("lib/assets/text/about_me/education.txt");

    aboutMe = aboutMe.replaceAll('\n', ' ');

    return (aboutMe: aboutMe, education: education);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    width = width < 800 ? 800 : width;

    return Container(
      // height: height,
      width: width,
      padding: const EdgeInsets.only(top: 50),
      color: Colors.transparent,
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: width/13.16, vertical: width/28.2),
        padding:  EdgeInsets.only(left: width/24.675, right: width/24.675, top: width/65.8, bottom: width/24.675),
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
                fontSize: width / 35.89090909,
                //decoration: TextDecoration.underline,
                //fontWeight: FontWeight.bold,
                //decorationStyle: TextDecorationStyle.double,
                decorationThickness: 0.5,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            IntrinsicHeight(
              child: FutureBuilder<({String aboutMe, String education})>(
                future: getMyInfo(),
                builder: (BuildContext context, AsyncSnapshot<({String aboutMe, String education})> snapshot) {
                  if (snapshot.hasData) {
                    String aboutMe = snapshot.data?.aboutMe ?? '';
                    String education = snapshot.data?.education ?? '';
                    return SelectableText(
                      aboutMe + education,
                      style: GoogleFonts.robotoMono(fontSize: width / 98.7),
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
