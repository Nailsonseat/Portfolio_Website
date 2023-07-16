import 'package:flutter/material.dart';

class Project {
  late String title;
  late Image image;
  late String briefDescription;
  late String source;
  late String description;
  late String pagePath;

  Project(
      {required this.title,
      required this.image,
      required this.briefDescription,
      required this.description,
      required this.source,
      required this.pagePath});
}

class ProjectPageProvider extends ChangeNotifier {
  double opacity = 1;

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
        title: 'Acharya Setu',
        image: Image.asset('lib/assets/images/project_images/acharya_setu.jpg'),
        source: "https://github.com/Nailsonseat/Acharya_Setu",
        pagePath: '/home/Acharya_Setu',
        briefDescription:
            "My most ambitious project ever, This app aims to reduce a teacher's time in non teaching activities, since only 19% of a teachers time is actually sent on teaching. The app provides a huge set of features to manipulate and create questions at the click of a button.",
        description: 'This Cross platform application gets many birds with one stone.\n\n'
            '• Randomized questions for each and every student for a specific question template.\n'
            '• Randomized question sets for a group of students, the user has the choice to divide the question set/bank in any number of sets, even one set of questions per student.\n\n'
            '• Easy to maintain and shareable question banks\n'
            '• Uses GPT API to to generate, extend and segment questions on a click of a button\n'),
    Project(
        title: 'Hospital Management Utility',
        image: Image.asset('lib/assets/images/project_images/hospital_management_utility.png'),
        source: "https://github.com/Nailsonseat/Hospital-Management-Utility",
        pagePath: '/home/Hospital_Management_Utility',
        briefDescription:
            "A hospital management software fully implemented in C++ that keeps records of patients and assigns them a appointment time, with 30 minutes of gaps with no overlapping of appointments. This also comes with a search engine with filters to find patients. ",
        description: ''),
    Project(
        title: "E-commerce Shopper's Behaviour Understanding",
        image: Image.asset('lib/assets/images/project_images/e_commerce_behaviour_understanding.png'),
        source: "https://github.com/Nailsonseat/E-commerce-Shopper-s-Behaviour-Understanding",
        pagePath: '/home/Ecommerce_Shoppers_Behaviour_and_Understanding',
        briefDescription:
            "My first Kaggle competition. This model predicts whether a person is going to buy a product based on a variety of factors ranging from time spent on product's page to current season to user's device info and bounce and exit rates. ",
        description: ''),
    Project(
        title: 'Data Into IPL',
        image: Image.asset('lib/assets/images/project_images/data_in_ipl.png'),
        source: "https://github.com/Nailsonseat/Data_into_IPL",
        pagePath: '/home/Data_Into_IPL',
        briefDescription:
            "This model predicts how much runs a team will score in the first 6 overs (also called power play). It uses data of players, their teams and the matches won by them, ever since the IPL started in 2008. ",
        description: ''),
    Project(
        title: 'Portfolio Website',
        image: Image.asset('lib/assets/images/project_images/portfolio.png'),
        source: "https://github.com/Nailsonseat/Portfolio_Website",
        pagePath: '/home/Portfolio_Website',
        briefDescription:
            "A website to showcase myself, my work and progress in a beautiful website, with easy to digest descriptions of each and every one of my project. ",
        description: ''),
    Project(
        title: 'Kastor',
        image: Image.asset('lib/assets/images/project_images/kastor.png'),
        source: "https://github.com/Nailsonseat/Kastor",
        pagePath: '/home/Kastor',
        briefDescription:
            "This is a Website that is supposed to fetch game prices from different platforms using web scraping and give you the best deal. Just like Trivago but for Games! ",
        description: ''),
    Project(
        title: 'LetsTalkk',
        image: Image.asset('lib/assets/images/project_images/messaging.png'),
        source: "https://github.com/Nailsonseat/LetsTalkk",
        pagePath: '/home/LetsTalkk',
        briefDescription:
            "A unique fusion of a chat app between whatsapp and discord that provides features like discord but with the easy to navigate UI of whatsapp like realtime chat apps.",
        description: ''),
    Project(
        title: 'Yoshop Web Scraper',
        image: Image.asset('lib/assets/images/project_images/yoshop_scraper.png'),
        source: "https://github.com/Nailsonseat/Yoshop-Web-Scraper",
        pagePath: '/home/Yoshop_Web_Scraper',
        briefDescription:
            "A web scraping project which scraps number of products category wise. It scrapes using Beautiful Soup and Selenium like libraries.",
        description: ''),
    Project(
        title: 'Holomorphic Bot',
        image: Image.asset('lib/assets/images/project_images/hola_bot.png'),
        source: "https://github.com/Nailsonseat/Hola_bot",
        pagePath: '/home/Hola_bot',
        briefDescription:
            "A tri-wheeler holomorphic bot that is able to traverse and move its limbs in all directions.",
        description: ''),
    Project(
        title: 'Machine Learning',
        image: Image.asset('lib/assets/images/project_images/machine_learning.png'),
        source: "https://github.com/Nailsonseat/Machine-Learning",
        pagePath: '/home/Machine_Learning',
        briefDescription:
            "This projects has my entire machine learning journey where I hard code and implement various machine learning algorithms from scratch without using any machine learning library. ",
        description: ''),
    Project(
        title: 'Classic Snake Focused Frames per Second',
        image: Image.asset('lib/assets/images/project_images/snake.png'),
        source: "https://github.com/Nailsonseat/Classic-Snake-By-2D-Focused-Frames-per-second",
        pagePath: '/home/Classic_Snake_FFPS',
        briefDescription:
            "My first ever project! The classic snake game with a twist! It only updates the screen where data is updated. It records high score and saves it along with the options for snake customization as well!",
        description: ''),
  ];
}
