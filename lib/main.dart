import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/providers/project_component_constraint_provider.dart';
import 'package:portfolio_website/providers/project_page_provider.dart';
import 'package:portfolio_website/providers/scroll_provider.dart';
import 'package:portfolio_website/routes.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //usePathUrlStrategy();
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
        ChangeNotifierProvider(create: (_) => ProjectComponentsConstraintsProvider())
      ],
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
