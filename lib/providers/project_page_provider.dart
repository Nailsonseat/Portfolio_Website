import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio_website/pages/projects/acharya_setu/acharya_setu.dart';
import 'package:portfolio_website/pages/projects/classic_snake_ffps/classic_snake_ffps.dart';
import 'package:portfolio_website/pages/projects/data_into_ipl/data_into_ipl.dart';
import 'package:portfolio_website/pages/projects/ecommerce_shoppers_behaviour_and_understanding/ecommerce_shoppers_behaviour_and_understanding.dart';
import 'package:portfolio_website/pages/projects/holomorphic_bot/holomorphic_bot.dart';
import 'package:portfolio_website/pages/projects/hospital_management_utility/hospital_management_utility.dart';
import 'package:portfolio_website/pages/projects/kastor/kastor.dart';
import 'package:portfolio_website/pages/projects/letstalkk/letstalkk.dart';
import 'package:portfolio_website/pages/projects/machine_learning/machine_learning.dart';
import 'package:portfolio_website/pages/projects/portfolio_website/portfolio_website.dart';
import 'package:portfolio_website/pages/projects/yoshop_web_scraper/yoshop_web_scraper.dart';

class Project {
  final String title;
  final Image image;
  final String briefDescription;
  final String source;
  final String description;
  final String pagePath;
  final Color primaryColor;
  final Color secondaryColor;

  Project(
      {required this.title,
      required this.image,
      required this.source,
      required this.pagePath,
      required this.briefDescription,
      required this.description,
      required this.primaryColor,
      required this.secondaryColor});
}

class ProjectPageProvider extends ChangeNotifier {
  double opacity = 1;

  ProjectPageProvider(BuildContext context) {
    _loadImages(context);
  }

  Future<void> _loadImages(BuildContext context) async {
    for (var project in projects) {
      await precacheImage(
        project.image.image,
        context,
      );
    }
    notifyListeners();
  }

  void toggleFade() {
    if (opacity == 1) {
      opacity = 0.5;
      notifyListeners();
      return;
    }
    opacity = 1;
    notifyListeners();
    return;
  }

  Project getProject(String title) {
    for (Project i in projects) {
      if (i.title == title) return i;
    }
    return projects[0];
  }

  List<Project> projects = [
    Project(
      title: "ONDC - Build for Bharat",
      image: Image.asset('lib/assets/images/project_banners/ondc.png'),
      source: "https://github.com/HareNTortoise/ONDC-Build-For-Bharat",
      pagePath: '/home/ONDC_Build_For_Bharat',
      briefDescription:
          """The challenge is to develop innovative solutions that leverage cutting-edge technologies to seamlessly digitalize and enhance product catalogs, offering a user-friendly experience for sellers and seller apps.""",
      description: '',
      primaryColor: HexColor('#b8daf2'),
      secondaryColor: HexColor('#5787ec'),
    ),
    Project(
      title: 'FOSS Overflow',
      image: Image.asset('lib/assets/images/project_banners/foss_overflow.png'),
      source: "https://github.com/OpenLake/Smart-Insti-App",
      pagePath: '/home/Foss_Overflow',
      briefDescription:
          "This app aims to solve the day-to-day problems that students and faculty face in IIT Bhilai and aims to consolidate a lot of useful applications into single app. This could include features like Time Table, Classroom Vacancy, Lost and Found, Chatrooms on various topics like Internet Issues. It could also have a broadcast feature which would be very useful in emergency situations.",
      description: '',
      primaryColor: HexColor('#c3dbf7'),
      secondaryColor: HexColor('#4075e6'),
    ),
    Project(
        title: 'Acharya Setu',
        image: Image.asset('lib/assets/images/project_banners/acharya_setu.jpg'),
        source: "https://github.com/Nailsonseat/Acharya_Setu",
        pagePath: '/home/Acharya_Setu',
        briefDescription:
            "My most ambitious project ever, This app aims to reduce a teacher's time in non teaching activities, since only 19% of a teachers time is actually sent on teaching. The app provides a huge set of features to manipulate and create questions at the click of a button.",
        description: '',
        primaryColor: AcharyaSetu().secondaryColor,
        secondaryColor: HexColor('#5545d9')),
    Project(
        title: 'Portfolio Website',
        image: Image.asset('lib/assets/images/project_banners/portfolio.png'),
        source: "https://github.com/Nailsonseat/Portfolio_Website",
        pagePath: '/home/Portfolio_Website',
        briefDescription:
            "A website to showcase myself, my work and progress in a beautiful website, with easy to digest descriptions of each and every one of my project. ",
        description: '',
        primaryColor: PortfolioWebsite().secondaryColor,
        secondaryColor: HexColor('#d14a3d')),
    Project(
        title: 'Hospital Management Utility',
        image: Image.asset('lib/assets/images/project_banners/hospital_management_utility.png'),
        source: "https://github.com/Nailsonseat/Hospital-Management-Utility",
        pagePath: '/home/Hospital_Management_Utility',
        briefDescription:
            "A hospital management software fully implemented in C++ that keeps records of patients and assigns them a appointment time, with 30 minutes of gaps with no overlapping of appointments. This also comes with a search engine with filters to find patients. ",
        description: '',
        primaryColor: HospitalManagementUtility().secondaryColor,
        secondaryColor: HexColor('#158dbf')),
    Project(
        title: "E-commerce Shopper's Behaviour Understanding",
        image: Image.asset('lib/assets/images/project_banners/e_commerce_behaviour_understanding.png'),
        source: "https://github.com/Nailsonseat/E-commerce-Shopper-s-Behaviour-Understanding",
        pagePath: '/home/Ecommerce_Shoppers_Behaviour_and_Understanding',
        briefDescription:
            "My first Kaggle competition. This model predicts whether a person is going to buy a product based on a variety of factors ranging from time spent on product's page to current season to user's device info and bounce and exit rates. ",
        description: '',
        primaryColor: EcommerceShoppersBehaviourAndUnderstanding().secondaryColor,
        secondaryColor: HexColor('#105952')),
    Project(
        title: 'Data Into IPL',
        image: Image.asset('lib/assets/images/project_banners/data_in_ipl.png'),
        source: "https://github.com/Nailsonseat/Data_into_IPL",
        pagePath: '/home/Data_Into_IPL',
        briefDescription:
            "This model predicts how much runs a team will score in the first 6 overs (also called power play). It uses data of players, their teams and the matches won by them, ever since the IPL started in 2008. ",
        description: '',
        primaryColor: DataIntoIPL().secondaryColor,
        secondaryColor: HexColor('#086b2a')),
    Project(
        title: 'Kastor',
        image: Image.asset('lib/assets/images/project_banners/kastor.png'),
        source: "https://github.com/Nailsonseat/Kastor",
        pagePath: '/home/Kastor',
        briefDescription:
            "This is a Website that is supposed to fetch game prices from different platforms using web scraping and give you the best deal. Just like Trivago but for Games! ",
        description: '',
        primaryColor: Kastor().secondaryColor,
        secondaryColor: HexColor('#491d07')),
    Project(
        title: 'Classic Snake Focused Frames per Second',
        image: Image.asset('lib/assets/images/project_banners/snake.png'),
        source: "https://github.com/Nailsonseat/Classic-Snake-By-2D-Focused-Frames-per-second",
        pagePath: '/home/Classic_Snake_FFPS',
        briefDescription:
            "My first ever project! The classic snake game with a twist! It only updates the screen where data is updated. It records high score and saves it along with the options for snake customization as well!",
        description: '',
        primaryColor: ClassicSnakeFFPS().secondaryColor,
        secondaryColor: HexColor('#34805b')),
    Project(
        title: 'Machine Learning',
        image: Image.asset('lib/assets/images/project_banners/machine_learning.png'),
        source: "https://github.com/Nailsonseat/Machine-Learning",
        pagePath: '/home/Machine_Learning',
        briefDescription:
            "This projects has my entire machine learning journey where I hard code and implement various machine learning algorithms from scratch without using any machine learning library. ",
        description: '',
        primaryColor: MachineLearning().secondaryColor,
        secondaryColor: HexColor('#425fdb')),
    Project(
        title: 'LetsTalkk',
        image: Image.asset('lib/assets/images/project_banners/messaging.png'),
        source: "https://github.com/Nailsonseat/LetsTalkk",
        pagePath: '/home/LetsTalkk',
        briefDescription:
            "A unique fusion of a chat app between whatsapp and discord that provides features like discord but with the easy to navigate UI of whatsapp like realtime chat apps.",
        description: '',
        primaryColor: LetsTalkk().secondaryColor,
        secondaryColor: HexColor('#4764ea')),
    Project(
        title: 'Yoshop Web Scraper',
        image: Image.asset('lib/assets/images/project_banners/yoshop_scraper.png'),
        source: "https://github.com/Nailsonseat/Yoshop-Web-Scraper",
        pagePath: '/home/Yoshop_Web_Scraper',
        briefDescription:
            "A web scraping project which scraps number of products category wise. It scrapes using Beautiful Soup and Selenium like libraries.",
        description: '',
        primaryColor: YoshopWebScraper().containerColor,
        secondaryColor: HexColor('#431e7b')),
    Project(
        title: 'Holomorphic Bot',
        image: Image.asset('lib/assets/images/project_banners/hola_bot.png'),
        source: "https://github.com/Nailsonseat/Hola_bot",
        pagePath: '/home/Hola_bot',
        briefDescription:
            "A tri-wheeler holomorphic bot that is able to traverse and move its limbs in all directions.",
        description: '',
        primaryColor: HolomorphicBot().secondaryColor,
        secondaryColor: HexColor('#bb512d')),
  ];
}
