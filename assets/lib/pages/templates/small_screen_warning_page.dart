import 'package:flutter/material.dart';

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          child: AspectRatio(
            aspectRatio: 3 / 3,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
              child: const Center(
                  child: Text(
                'This website is not configured for small screens yet. Please open this website on a desktop screen',
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ),
      ),
    );
  }
}
