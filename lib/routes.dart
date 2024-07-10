import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_website/all_projects.dart';
import 'package:portfolio_website/constants/project_constants.dart';
import 'package:portfolio_website/pages/home/home_main.dart';
import 'package:portfolio_website/pages/launch/launch_page.dart';
import 'package:portfolio_website/providers/launch_page_animation_provider.dart';
import 'package:portfolio_website/providers/project_slider_provider.dart';
import 'package:provider/provider.dart';

final GoRouter routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          MaterialPage(child: ChangeNotifierProvider(child: const LaunchPage(), create: (_) => LaunchPageProvider())),
      routes: [
        GoRoute(
          path: 'home',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => ProjectSliderProvider()),
              ],
              child: const HomeMain(),
            ),
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 1000),
            transitionsBuilder: (_, animation, ___, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            },
          ),
          routes: [
            GoRoute(
              path: 'Acharya_Setu',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.acharyaSetu),
              ),
            ),
            GoRoute(
              path: 'Hospital_Management_Utility',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.hospitalManagementUtility),
              ),
            ),
            GoRoute(
              path: 'Ecommerce_Shoppers_Behaviour_and_Understanding',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.ecommerceShoppersBehaviourAndUnderstanding),
              ),
            ),
            GoRoute(
              path: 'Data_Into_IPL',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.dataIntoIPL),
              ),
            ),
            GoRoute(
              path: 'Portfolio_Website',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.portfolioWebsite),
              ),
            ),
            GoRoute(
              path: 'Kastor',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.kastor),
              ),
            ),
            GoRoute(
              path: 'LetsTalkk',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.letsTalkk),
              ),
            ),
            GoRoute(
              path: 'Yoshop_Web_Scraper',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.yoshopWebScraper),
              ),
            ),
            GoRoute(
              path: 'Hola_Bot',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.holomorphicBot),
              ),
            ),
            GoRoute(
              path: 'Machine_Learning',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.machineLearning),
              ),
            ),
            GoRoute(
              path: 'Classic_Snake_FFPS',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.classicSnake),
              ),
            ),
            GoRoute(
              path: 'Foss_Overflow',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.fossOverflow),
              ),
            ),
            GoRoute(
              path: 'ONDC_Build_For_Bharat',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.ondcBuildForBharat),
              ),
            ),
            GoRoute(
              path: 'Vaulto',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.vaulto),
              ),
            ),
            GoRoute(
              path: 'Trance',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.trance),
              ),
            ),
            GoRoute(
              path: 'Smart_India_Hackathon_2023',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.smartIndiaHackathon2023),
              ),
            ),
            GoRoute(
              path: 'Samsung_Solve_For_Tomorrow',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.samsungSolveForTomorrow),
              ),
            ),
            GoRoute(
              path: 'Grocery_Mandi',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.groceryMandi),
              ),
            ),
            GoRoute(
              path: 'Shell_AI_Hackathon',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.shellAIHackathon),
              ),
            ),
            GoRoute(
              path: 'Business_Data_Management',
              pageBuilder: (context, state) => MaterialPage(
                child: getProjectPageTemplate(ProjectNames.businessDataManagement),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
