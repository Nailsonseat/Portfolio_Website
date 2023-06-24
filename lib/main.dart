import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:portfolio_website/pages/launch_page.dart';
import 'package:portfolio_website/providers/launch_page_animation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  setUrlStrategy(PathUrlStrategy());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ChangeNotifierProvider(
          child: const LaunchPage(),
          create: (_) => LaunchPageProvider(),
        ),
      ),
    );
  }
}
