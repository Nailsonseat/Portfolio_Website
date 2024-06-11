import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:portfolio_website/providers/chatbot_provider.dart';
import 'package:portfolio_website/providers/project_component_constraint_provider.dart';
import 'package:portfolio_website/providers/project_page_provider.dart';
import 'package:portfolio_website/providers/scroll_provider.dart';
import 'package:portfolio_website/routes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'firebase_options.dart';

void main() async {
  Gemini.init(apiKey: const String.fromEnvironment('GEMINI_API_KEY'));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
        ChangeNotifierProvider(create: (_) => ProjectPageProvider(context)),
        ChangeNotifierProvider(create: (_) => ProjectComponentsConstraintsProvider()),
        ChangeNotifierProvider(create: (_) => ChatBotProvider())
      ],
      builder: (context,child) => ResponsiveBreakpoints.builder(child: child!,  breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: double.infinity, name: DESKTOP),
      ],),
      child: MaterialApp.router(
        title: 'Portfolio Website',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: routes,
      ),
    );
  }
}
