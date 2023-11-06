import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(
        builder: (context) {
          if (ResponsiveBreakpoints.of(context).isMobile) {
            return Container(
              color: Colors.red,
            ); // Your widget for desktop
          } else {
            return ResponsiveScaledBox(
              width: ResponsiveValue<double>(context, conditionalValues: [
                Condition.equals(name: MOBILE, value: 450),
                Condition.between(start: 800, end: 1100, value: 800),
                Condition.between(start: 1000, end: 1200, value: 1000),
                // There are no conditions for width over 1200
                // because the `maxWidth` is set to 1200 via the MaxWidthBox.
              ]).value,
              child: const MaxWidthBox(maxWidth: 200,child: Placeholder(),),
            ); // Your widget for non-desktop
          }
        },
      ),
    );
  }
}
