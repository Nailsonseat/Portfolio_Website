import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_website/pages/home_page.dart';
import 'package:portfolio_website/pages/launch_page.dart';
import 'package:portfolio_website/providers/launch_page_animation_provider.dart';
import 'package:provider/provider.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          MaterialPage(child: ChangeNotifierProvider(child: const LaunchPage(), create: (_) => LaunchPageProvider())),
      routes: [
        GoRoute(
          path: 'home',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: HomePage(),
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 1000),
            transitionsBuilder: (_, animation, ___, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            },
          ),
        ),
      ],
    ),
  ],
);
