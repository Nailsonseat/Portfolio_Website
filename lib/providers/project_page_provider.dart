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
        briefDescription: '',
        description: ''),
    Project(
        title: 'Hospital Management Utility',
        image: Image.asset('lib/assets/images/project_images/hospital_management_utility.png'),
        briefDescription: '',
        description: ''),
    Project(
        title: "E-commerce Shopper's Behaviour Understanding",
        image: Image.asset('lib/assets/images/project_images/e_commerce_behaviour_understanding.png'),
        briefDescription: '',
        description: ''),
    Project(
        title: 'Data Into IPL',
        image: Image.asset('lib/assets/images/project_images/data_in_ipl.png'),
        briefDescription: '',
        description: ''),
    Project(
        title: 'Portfolio Website',
        image: Image.asset('lib/assets/images/project_images/portfolio.png'),
        briefDescription: '',
        description: ''),
    Project(
        title: 'Kastor',
        image: Image.asset('lib/assets/images/project_images/kastor.png'),
        briefDescription: '',
        description: ''),
    Project(
        title: 'LetsTalkk',
        image: Image.asset('lib/assets/images/project_images/messaging.png'),
        briefDescription: '',
        description: ''),
    Project(
        title: 'Yoshop Web Scraper',
        image: Image.asset('lib/assets/images/project_images/yoshop_scraper.png'),
        briefDescription: '',
        description: ''),
    Project(
        title: 'Holomorphic Bot',
        image: Image.asset('lib/assets/images/project_images/hola_bot.png'),
        briefDescription: '',
        description: ''),
    Project(
        title: 'Machine Learning',
        image: Image.asset('lib/assets/images/project_images/machine_Learning.png'),
        briefDescription: '',
        description: ''),
    Project(
        title: 'Classic Snake By 2D Focused Frames per second',
        image: Image.asset('lib/assets/images/project_images/snake.png'),
        briefDescription: '',
        description: ''),
  ];
}