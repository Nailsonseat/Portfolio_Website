import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePageTwo extends StatelessWidget {
  const HomePageTwo({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    width = width < 800 ? 800 : width;

    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(top: 50),
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 150,vertical: 70),
        padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 30),
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
              style: GoogleFonts.workSans(
                fontSize: 55,
                //decoration: TextDecoration.underline,
                //fontWeight: FontWeight.bold,
                //decorationStyle: TextDecorationStyle.double,
                decorationThickness: 0.5,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            FutureBuilder(
              future: rootBundle.loadString("lib/assets/about_me.txt"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return SelectableText(
                    snapshot.data!,
                    style: GoogleFonts.robotoMono(fontSize: 20),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
