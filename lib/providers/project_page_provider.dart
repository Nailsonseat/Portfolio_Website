import 'package:flutter/material.dart';

class Project {
  late String title;
  late Image image;
  late String briefDescription;
  late String description;

  Project({required this.title, required this.image, required this.briefDescription, required this.description});
}

class ProjectPageProvider extends ChangeNotifier {
  double opacity = 1;

  void toggleFade(){
    if(opacity == 1){
      opacity = 0.5;
      notifyListeners();
      return;
    }
    opacity = 1;
    notifyListeners();
    return;
  }

  List<Project> projects = [
    Project(
        title: 'Acharya Setu',
        image: Image.asset('lib/assets/images/project_images/acharya_setu.jpg'),
        briefDescription: "My most ambitious project ever, This app aims to reduce a teacher's time in non teaching activities, since only 19% of a teachers time is actually sent on teaching. The app provides a huge set of features to manipulate and create questions at the click of a button. ",
        description: ''),
    Project(
        title: 'Hospital Management Utility',
        image: Image.asset('lib/assets/images/project_images/hospital_management_utility.png'),
        briefDescription: "A hospital management software fully implemented in C++ that keeps records of patients and assigns them a appointment time, with 30 minutes of gaps with no overlapping of appointments. This also comes with a search engine with filters to find patients. ",
        description: ''),
    Project(
        title: "E-commerce Shopper's Behaviour Understanding",
        image: Image.asset('lib/assets/images/project_images/e_commerce_behaviour_understanding.png'),
        briefDescription: " My first Kaggle competition. This model predicts whether a person is going to buy a product based on a variety of factors ranging from time spent on product's page to current season to user's device info and bounce and exit rates. ",
        description: ''),
    Project(
        title: 'Data Into IPL',
        image: Image.asset('lib/assets/images/project_images/data_in_ipl.png'),
        briefDescription: "This model predicts how much runs a team will score in the first 6 overs (also called power play). It uses data of players, their teams and the matches won by them, ever since the IPL started in 2008. ",
        description: ''),
    Project(
        title: 'Portfolio Website',
        image: Image.asset('lib/assets/images/project_images/portfolio.png'),
        briefDescription: "A website to showcase myself, my work and progress in a beautiful website, with easy to digest descriptions of each and every one of my project. ",
        description: ''),
    Project(
        title: 'Kastor',
        image: Image.asset('lib/assets/images/project_images/kastor.png'),
        briefDescription: "This is a Website that is supposed to fetch game prices from different platforms using web scraping and give you the best deal. Just like Trivago but for Games! ",
        description: ''),
    Project(
        title: 'LetsTalkk',
        image: Image.asset('lib/assets/images/project_images/messaging.png'),
        briefDescription: "A unique fusion of a chat app between whatsapp and discord that provides features like discord but with the easy to navigate UI of whatsapp like realtime chat apps.",
        description: ''),
    Project(
        title: 'Yoshop Web Scraper',
        image: Image.asset('lib/assets/images/project_images/yoshop_scraper.png'),
        briefDescription: "A web scraping project which scraps number of products category wise. It scrapes using Beautiful Soup and Selenium like libraries.",
        description: ''),
    Project(
        title: 'Holomorphic Bot',
        image: Image.asset('lib/assets/images/project_images/hola_bot.png'),
        briefDescription: "A tri-wheeler holomorphic bot that is able to traverse and move its limbs in all directions.",
        description: ''),
    Project(
        title: 'Machine Learning',
        image: Image.asset('lib/assets/images/project_images/machine_Learning.png'),
        briefDescription: "This projects has my entire machine learning journey where I hard code and implement various machine learning algorithms from scratch without using any machine learning library. ",
        description: ''),
    Project(
        title: 'Classic Snake By 2D Focused Frames per second',
        image: Image.asset('lib/assets/images/project_images/snake.png'),
        briefDescription: "My first ever project! The classic snake game with a twist! It only updates the screen where data is updated. It records high score and saves it along with the options for snake customization as well!",
        description: ''),
  ];
}