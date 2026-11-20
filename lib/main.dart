import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:material_ui/material_ui.dart';
import 'package:portfolio_website/blocs/chat/chat_bloc.dart';
import 'package:portfolio_website/data/chat_repository.dart';
import 'package:portfolio_website/data/visitor_repository.dart';
import 'package:portfolio_website/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: const String.fromEnvironment('GEMINI_API_KEY'));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => VisitorRepository()),
        RepositoryProvider(create: (_) => ChatRepository()),
      ],
      // The chat bloc lives above the router so the conversation survives
      // closing and reopening the chat dialog.
      child: BlocProvider(
        create: (context) => ChatBloc(chatRepository: context.read<ChatRepository>()),
        child: ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: double.infinity, name: DESKTOP),
          ],
          child: MaterialApp.router(
            title: 'Portfolio Website',
            theme: ThemeData(useMaterial3: true),
            routerConfig: routes,
            // Several dependencies (flutter_html, percent_indicator, timelines_plus,
            // animated_toggle_switch, ...) still use package:flutter/material.dart,
            // whose Theme/Localizations are separate from material_ui's. The
            // bridge exposes our theme to them. Remove once they migrate.
            // ignore: deprecated_member_use
            builder: (context, child) => MaterialUiCompatibilityBridge(child: child!),
          ),
        ),
      ),
    );
  }
}
