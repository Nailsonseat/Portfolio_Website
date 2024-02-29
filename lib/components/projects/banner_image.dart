import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({super.key, required this.height, required this.width, required this.image});

  final double height;
  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fitWidth,
          ),
          color: Colors.white,
        ),
        child: ShaderMask(
          blendMode: BlendMode.dstIn,
          child: Container(
            color: Colors.white,
          ),
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.white, Colors.transparent],
              stops: [0.1, 0.7],
            ).createShader(bounds);
          },
        ),
      ),
    );
  }
}
