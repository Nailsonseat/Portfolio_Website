import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_website/pages/home/home_main.dart';
import 'package:portfolio_website/pages/launch/launch_page.dart';
import 'package:portfolio_website/pages/projects/foss_overflow/foss_overflow.dart';
import 'package:portfolio_website/pages/projects/kastor/kastor.dart';
import 'package:portfolio_website/pages/projects/letstalkk/letstalkk.dart';
import 'package:portfolio_website/pages/projects/acharya_setu/acharya_setu.dart';
import 'package:portfolio_website/pages/projects/classic_snake_ffps/classic_snake_ffps.dart';
import 'package:portfolio_website/pages/projects/data_into_ipl/data_into_ipl.dart';
import 'package:portfolio_website/pages/projects/ecommerce_shoppers_behaviour_and_understanding/ecommerce_shoppers_behaviour_and_understanding.dart';
import 'package:portfolio_website/pages/projects/holomorphic_bot/holomorphic_bot.dart';
import 'package:portfolio_website/pages/projects/hospital_management_utility/hospital_management_utility.dart';
import 'package:portfolio_website/pages/projects/machine_learning/machine_learning.dart';
import 'package:portfolio_website/pages/projects/ondc_build_for_bharat/build_for_bharat.dart';
import 'package:portfolio_website/pages/projects/portfolio_website/portfolio_website.dart';
import 'package:portfolio_website/pages/projects/yoshop_web_scraper/yoshop_web_scraper.dart';
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
            GoRoute(path: 'Acharya_Setu', pageBuilder: (context, state) => MaterialPage(child: AcharyaSetu())),
            GoRoute(path: 'Hospital_Management_Utility', pageBuilder: (context, state) => MaterialPage(child: HospitalManagementUtility())),
            GoRoute(path: 'Ecommerce_Shoppers_Behaviour_and_Understanding', pageBuilder: (context, state) => MaterialPage(child: EcommerceShoppersBehaviourAndUnderstanding())),
            GoRoute(path: 'Data_Into_IPL', pageBuilder: (context, state) => MaterialPage(child: DataIntoIPL())),
            GoRoute(path: 'Portfolio_Website', pageBuilder: (context, state) => MaterialPage(child: PortfolioWebsite())),
            GoRoute(path: 'Kastor', pageBuilder: (context, state) => MaterialPage(child: Kastor())),
            GoRoute(path: 'LetsTalkk', pageBuilder: (context, state) => MaterialPage(child: LetsTalkk())),
            GoRoute(path: 'Yoshop_Web_Scraper', pageBuilder: (context, state) => MaterialPage(child: YoshopWebScraper())),
            GoRoute(path: 'Hola_Bot', pageBuilder: (context, state) => MaterialPage(child: HolomorphicBot())),
            GoRoute(path: 'Machine_Learning', pageBuilder: (context, state) => MaterialPage(child: MachineLearning())),
            GoRoute(path: 'Classic_Snake_FFPS', pageBuilder: (context, state) => MaterialPage(child: ClassicSnakeFFPS())),
            GoRoute(path: 'Foss_Overflow', pageBuilder: (context, state) => const MaterialPage(child: FossOverflow())),
            GoRoute(path: 'ONDC_Build_For_Bharat', pageBuilder: (context, state) => MaterialPage(child: ONDCBuildForBharat())),
          ],
        ),
      ],
    ),
  ],
);
