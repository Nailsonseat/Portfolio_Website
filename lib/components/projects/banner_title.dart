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
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 230),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            title,
            maxLines: 2,
            minFontSize: 80,
            style: GoogleFonts.poppins(
              fontSize: 110,
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


