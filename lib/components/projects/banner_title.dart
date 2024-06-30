import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BannerTitle extends StatelessWidget {
  const BannerTitle({super.key, required this.height, required this.width, required this.title});

  final double height;
  final double width;
  final String title;


  @override
  Widget build(BuildContext context) {
    double width = 1978;

    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;

    if(isLengthGreaterThanWidth){
      width = 455;
    }
    return Container(
      alignment: isLengthGreaterThanWidth  ? Alignment.center : Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: isLengthGreaterThanWidth ? 10 : 120),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AutoSizeText(
            title,
            maxLines: 2,
            minFontSize: 20,
            textAlign: isLengthGreaterThanWidth ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.poppins(
              fontSize: isLengthGreaterThanWidth ? 40 : 110,
              shadows: [
                const Shadow(
                  offset: Offset(0, 2), // Specify the shadow offset
                  color: Colors.grey,
                  blurRadius: 3, // Specify the blur radius of the shadow
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


