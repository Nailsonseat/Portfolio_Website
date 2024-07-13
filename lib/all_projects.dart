import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio_website/components/projects/pdf_section.dart';
import 'package:portfolio_website/components/projects/project_component.dart';
import 'package:portfolio_website/constants/project_constants.dart';
import 'package:portfolio_website/pages/templates/project_page_template.dart';
import 'components/projects/text_section.dart';
import 'components/projects/youtube_section.dart';

class Project {
  final String title;
  final String image;
  final String briefDescription;
  final String source;
  final String description;
  final String pagePath;
  final Color buttonSecondaryColor;
  final Color buttonPrimaryColor;
  final Color primaryColor;
  final Color secondaryColor;
  final List sections;

  final List<IconData> timelineIcons;
  final List<TableOfContentsComponent> tableOfContents;

  Project({
    required this.title,
    required this.image,
    required this.source,
    required this.pagePath,
    required this.briefDescription,
    required this.description,
    required this.buttonSecondaryColor,
    required this.buttonPrimaryColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.sections,
    required this.timelineIcons,
    required this.tableOfContents,
  });
}

Project getProject(String title) {
  for (Project project in projects) {
    if (project.title == title) {
      return project;
    }
  }
  return projects[0];
}

ProjectPageTemplate getProjectPageTemplate(String title) {
  Project project = getProject(title);
  return ProjectPageTemplate(
    projectTitle: project.title,
    bannerImage: project.image,
    sections: project.sections,
    timelineIcons: project.timelineIcons,
    secondaryColor: project.primaryColor,
    primaryColor: project.secondaryColor,
    tableOfContents: project.tableOfContents,
  );
}

List<Project> projects = [
  Project(
    title: ProjectNames.samsungSolveForTomorrow,
    image: 'lib/assets/images/project_banners/samsung_solve_for_tomorrow.jpg',
    source: '',
    pagePath: '/home/Samsung_Solve_For_Tomorrow',
    briefDescription:
        'Samsung Solve for Tomorrow is a national competition that encourages students to apply STEM(Science, Technology, Engineering, and Math) skills to address real-world issues in their communities. Open to public school students aged 14-17 and college students aged 17-22, the program provides an opportunity to develop innovative solutions to societal challenges.',
    description: '',
    buttonSecondaryColor: HexColor('#ffad99'),
    buttonPrimaryColor: HexColor('#9d2718'),
    primaryColor: HexColor('#ffad99'),
    secondaryColor: HexColor('#f55138'),
    sections: [
      HtmlSection(title: "Description", bodyPath: "lib/pages/projects/samsung_solve_for_tomorrow/description.html"),
      HtmlSection(title: "Journey", bodyPath: "lib/pages/projects/samsung_solve_for_tomorrow/journey.html"),
      HtmlSection(title: "Next Step", bodyPath: "lib/pages/projects/samsung_solve_for_tomorrow/next_step.html"),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "Journey", subComponents: []),
      TableOfContentsComponent(title: "Next Step", subComponents: []),
    ],
  ),
  Project(
    title: ProjectNames.ondcBuildForBharat,
    image: 'lib/assets/images/project_banners/ondc.png',
    source: "https://github.com/HareNTortoise/ONDC-Build-For-Bharat",
    pagePath: '/home/ONDC_Build_For_Bharat',
    briefDescription:
        """The challenge is to develop innovative solutions that leverage cutting-edge technologies to seamlessly digitalize and enhance product catalogs, offering a user-friendly experience for sellers and seller apps.""",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: "lib/pages/projects/ondc_build_for_bharat/description.html"),
      HtmlSection(title: "Conditions", bodyPath: "lib/pages/projects/ondc_build_for_bharat/conditions.html"),
      HtmlSection(title: "Team", bodyPath: "lib/pages/projects/ondc_build_for_bharat/team.html"),
      HtmlSection(title: "Project", bodyPath: "lib/pages/projects/ondc_build_for_bharat/dataset.html"),
      HtmlSection(title: "Conclusion", bodyPath: "lib/pages/projects/ondc_build_for_bharat/conclusion.html"),
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "Conditions", subComponents: []),
      TableOfContentsComponent(title: "Team", subComponents: []),
      TableOfContentsComponent(title: "Project", subComponents: []),
      TableOfContentsComponent(title: "Conclusion", subComponents: []),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
    ],
    buttonSecondaryColor: HexColor('#b8daf2'),
    buttonPrimaryColor: HexColor('#5787ec'),
    secondaryColor: HexColor('#8f9fef'),
    primaryColor: HexColor('#e9f4ff'),
  ),
  Project(
    title: ProjectNames.smartIndiaHackathon2023,
    image: 'lib/assets/images/project_banners/smart_india_hackathon_2023.png',
    source: '',
    pagePath: '/home/Smart_India_Hackathon_2023',
    briefDescription: """The Smart India Hackathon (SIH) is a nationwide initiative in India aimed at fostering
    innovation and solving real-world problems through technology. Launched in 2017 by the Ministry
    of Education's Innovation Cell and the All India Council for Technical Education (AICTE), SIH
    brings together students, academicians, industry experts, and government officials to
    collaborate on solving pressing challenges.""",
    description: '',
    buttonSecondaryColor: HexColor('#b3ffd0'),
    buttonPrimaryColor: HexColor('#00c94e'),
    primaryColor: HexColor('#80ffb1'),
    secondaryColor: HexColor('#00ba48'),
    sections: [
      HtmlSection(title: "Description", bodyPath: 'lib/pages/projects/smart_india_hackathon_2023/description.html'),
      const PDFSection(
          title: 'Our Presentation',
          pdfPath:
              'https://raw.githubusercontent.com/Nailsonseat/Portfolio_Website/master/lib/pages/projects/smart_india_hackathon_2023/presentation.pdf'),
      const PDFSection(
          title: 'Our Project Report',
          pdfPath:
              'https://raw.githubusercontent.com/Nailsonseat/Portfolio_Website/master/lib/pages/projects/smart_india_hackathon_2023/prospective.pdf'),
      HtmlSection(title: "Hackathon Results", bodyPath: 'lib/pages/projects/smart_india_hackathon_2023/internals.html'),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      EvaIcons.fileText,
      LineIcons.toolbox,
      LineIcons.tools,
      LineIcons.award,
      EvaIcons.bulbOutline,
      Ionicons.funnel_outline,
      Ionicons.receipt_outline,
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "Our Presentation", subComponents: []),
      TableOfContentsComponent(title: "Our Project Report", subComponents: []),
      TableOfContentsComponent(title: "Hackathon Results", subComponents: []),
    ],
  ),
  Project(
    title: ProjectNames.fossOverflow,
    image: 'lib/assets/images/project_banners/foss_overflow.png',
    source: "https://github.com/OpenLake/Smart-Insti-App",
    pagePath: '/home/Foss_Overflow',
    briefDescription:
        "This app aims to solve the day-to-day problems that students and faculty face in IIT Bhilai and aims to consolidate a lot of useful applications into single app. This could include features like Time Table, Classroom Vacancy, Lost and Found, Chatrooms on various topics like Internet Issues. It could also have a broadcast feature which would be very useful in emergency situations.",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: 'lib/pages/projects/foss_overflow/description.html'),
      HtmlSection(title: "Mentors", bodyPath: 'lib/pages/projects/foss_overflow/mentors.html'),
      HtmlSection(title: "Tech Stack", bodyPath: 'lib/pages/projects/foss_overflow/techstack.html'),
      HtmlSection(title: "Authentication", bodyPath: 'lib/pages/projects/foss_overflow/authentication.html'),
      HtmlSection(title: "Database and Storage", bodyPath: 'lib/pages/projects/foss_overflow/database_storage.html'),
      HtmlSection(title: "Admin Role", bodyPath: 'lib/pages/projects/foss_overflow/admin.html'),
      HtmlSection(title: "User Features", bodyPath: 'lib/pages/projects/foss_overflow/features.html'),
      HtmlSection(title: "Conclusion", bodyPath: 'lib/pages/projects/foss_overflow/conclusion.html'),
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "Mentors", subComponents: []),
      TableOfContentsComponent(title: "TechStack", subComponents: []),
      TableOfContentsComponent(title: "Authentication", subComponents: []),
      TableOfContentsComponent(title: "Database & Storage", subComponents: []),
      TableOfContentsComponent(title: "Admin Role", subComponents: []),
      TableOfContentsComponent(title: "User Features", subComponents: []),
      TableOfContentsComponent(title: "Conclusion", subComponents: []),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
      Ionicons.bookmark_sharp,
    ],
    buttonSecondaryColor: HexColor('#c3dbf7'),
    buttonPrimaryColor: HexColor('#4075e6'),
    secondaryColor: HexColor('#4075e6'),
    primaryColor: HexColor('#c3dbf7'),
  ),
  Project(
    title: ProjectNames.shellAIHackathon,
    image: 'lib/assets/images/project_banners/shell.jpg',
    source: 'https://github.com/Nailsonseat/Shell_AI_Hackathon',
    pagePath: '/home/Shell_AI_Hackathon',
    briefDescription:
        'Shell.ai Hackathon for Sustainable and Affordable Energy, a platform that brings together brilliant minds passionate about digital solutions and AI, to tackle real energy challenges and help build a lower-carbon world.',
    description: '',
    buttonSecondaryColor: HexColor('#ffe98c'),
    buttonPrimaryColor: HexColor('#c9a200'),
    primaryColor: HexColor('#ffe98c'),
    secondaryColor: HexColor('#ff584f'),
    sections: [
      HtmlSection(title: "Description", bodyPath: 'lib/pages/projects/shell_ai_hackathon/description.html'),
      HtmlSection(title: "Tech Stack", bodyPath: 'lib/pages/projects/shell_ai_hackathon/techstack.html'),
      HtmlSection(title: "Project", bodyPath: 'lib/pages/projects/shell_ai_hackathon/dataset.html'),
      HtmlSection(title: "Results", bodyPath: 'lib/pages/projects/shell_ai_hackathon/results.html'),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      LineIcons.toolbox,
      LineIcons.tools,
      LineIcons.award,
      EvaIcons.bulbOutline,
      Ionicons.funnel_outline,
      Ionicons.receipt_outline,
      Ionicons.bar_chart_outline,
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "TechStack", subComponents: []),
      TableOfContentsComponent(title: "Project", subComponents: []),
      TableOfContentsComponent(title: "Results", subComponents: []),
    ],
  ),
  Project(
    title: ProjectNames.vaulto,
    image: 'lib/assets/images/project_banners/vaulto.png',
    source: 'https://github.com/Nailsonseat/Vaulto',
    pagePath: '/home/Vaulto',
    briefDescription:
        'A safe place to store all your passwords, cards, notes, etc. This app is packed with all the security features like Asymmetric RSA algorithm for passwords encryption sandwiched with symmetric algorithm for an extra layer of security alongwith the traditional hashing algorithm and finally the cherry on the top biometric authentication!!!',
    description: '',
    buttonSecondaryColor: Colors.black12,
    buttonPrimaryColor: Colors.black87,
    primaryColor: Colors.grey[300]!,
    secondaryColor: Colors.black87,
    sections: [
      HtmlSection(title: "Description", bodyPath: 'lib/pages/projects/vaulto/description.html'),
      HtmlSection(title: "Tech Stack", bodyPath: 'lib/pages/projects/vaulto/techstack.html'),
      HtmlSection(title: "Security", bodyPath: 'lib/pages/projects/vaulto/security.html'),
      HtmlSection(title: "Workflow", bodyPath: 'lib/pages/projects/vaulto/workflow.html'),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      LineIcons.toolbox,
      LineIcons.tools,
      LineIcons.alternateShield,
      EvaIcons.globe,
      LineIcons.award,
      EvaIcons.bulbOutline,
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "TechStack", subComponents: []),
      TableOfContentsComponent(title: "Security", subComponents: []),
      TableOfContentsComponent(title: "Workflow", subComponents: []),
    ],
  ),
  Project(
    title: ProjectNames.groceryMandi,
    image: 'lib/assets/images/project_banners/grocery_mandi.png',
    source: 'https://github.com/Nailsonseat/Grocery-Mandi',
    pagePath: '/home/Grocery_Mandi',
    briefDescription:
        'The project is a grocery shopping website called Grocery Mandi, where there are three roles that can uses the platform admin, seller and buyer. An all in one platform for all your grocery needs.',
    description: '',
    buttonSecondaryColor: HexColor('#c7ffeb'),
    buttonPrimaryColor: HexColor('#41A46F'),
    primaryColor: HexColor('#9effdd'),
    secondaryColor: HexColor('#00c781'),
    sections: [
      HtmlSection(title: "Description", bodyPath: 'lib/pages/projects/grocery_mandi/description.html'),
      HtmlSection(title: "Tech Stack", bodyPath: 'lib/pages/projects/grocery_mandi/techstack.html'),
      YoutubeSection(title: "Demo Video", videoLink: 'https://youtu.be/fScVpIC1Yys'),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      LineIcons.toolbox,
      LineIcons.tools,
      LineIcons.video,
      LineIcons.videoFile,
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "TechStack", subComponents: []),
      TableOfContentsComponent(title: "Demo Video", subComponents: []),
    ],
  ),
  Project(
    title: ProjectNames.trance,
    image: 'lib/assets/images/project_banners/trance.png',
    source: 'https://github.com/Nailsonseat/Trance',
    pagePath: '/home/Trance',
    briefDescription:
        'The project is a music streaming website called Trance, where there are three roles that can uses the platform admin, creator and user. The admin has authority to watch all statistics, and remove and delete any song or album. The creator can add new songs and albums and listen to songs. The user role has minimal features where they can only listen to songs. Also comes with features such as filters, reporting, rating songs and search them.',
    description: '',
    buttonSecondaryColor: HexColor('#CCD0F5'),
    buttonPrimaryColor: HexColor('#5658C7'),
    primaryColor: HexColor('#bdbeff'),
    secondaryColor: HexColor('#5c5ffa'),
    sections: [
      HtmlSection(title: "Description", bodyPath: 'lib/pages/projects/trance/description.html'),
      HtmlSection(title: "Tech Stack", bodyPath: 'lib/pages/projects/trance/techstack.html'),
      HtmlSection(title: "Website", bodyPath: 'lib/pages/projects/trance/website.html'),
      YoutubeSection(title: "Demo Video", videoLink: 'https://youtu.be/vqNatIsuscQ'),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      LineIcons.toolbox,
      LineIcons.tools,
      LineIcons.award,
      EvaIcons.bulbOutline,
      EvaIcons.clipboard,
      EvaIcons.clipboard,
      EvaIcons.clipboard,
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "TechStack", subComponents: []),
      TableOfContentsComponent(title: "Website", subComponents: []),
      TableOfContentsComponent(title: "Demo Video", subComponents: []),
    ],
  ),
  Project(
    title: ProjectNames.businessDataManagement,
    image: 'lib/assets/images/project_banners/business_data_management.jpg',
    source: '',
    pagePath: '/home/Business_Data_Management',
    briefDescription:
        'BDM Capstone Project is an independent research project where the student is expected to reach out to a business firm, identify the problems they face, collect primary data pertaining to it, clean the data, analyze it, and provide valuable insights to the decision maker(s).',
    description: '',
    buttonSecondaryColor: HexColor('#90C0F0'),
    buttonPrimaryColor: HexColor('#012E46'),
    primaryColor: HexColor('#90C0F0'),
    secondaryColor: HexColor('#012E46'),
    sections: [
      HtmlSection(title: "Description", bodyPath: 'lib/pages/projects/business_data_management/description.html'),
      const PDFSection(
          title: 'Proposal',
          pdfPath:
              'https://raw.githubusercontent.com/Nailsonseat/Portfolio_Website/master/lib/pages/projects/business_data_management/proposal.pdf'),
      const PDFSection(
          title: 'Interim Report',
          pdfPath:
              'https://raw.githubusercontent.com/Nailsonseat/Portfolio_Website/master/lib/pages/projects/business_data_management/mid_report.pdf'),
      const PDFSection(
          title: 'Final Report',
          pdfPath:
              'https://raw.githubusercontent.com/Nailsonseat/Portfolio_Website/master/lib/pages/projects/business_data_management/final_submission.pdf'),
      const PDFSection(
          title: 'Presentation',
          pdfPath:
              'https://raw.githubusercontent.com/Nailsonseat/Portfolio_Website/master/lib/pages/projects/business_data_management/presentation.pdf'),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "Proposal", subComponents: []),
      TableOfContentsComponent(title: "Interim Report", subComponents: []),
      TableOfContentsComponent(title: "Final Report", subComponents: []),
      TableOfContentsComponent(title: "Presentation", subComponents: []),
    ],
  ),
  Project(
    title: ProjectNames.acharyaSetu,
    image: 'lib/assets/images/project_banners/acharya_setu.jpg',
    source: "https://github.com/Nailsonseat/Acharya_Setu",
    pagePath: '/home/Acharya_Setu',
    briefDescription:
        "My most ambitious project ever, This app aims to reduce a teacher's time in non teaching activities, since only 19% of a teachers time is actually sent on teaching. The app provides a huge set of features to manipulate and create questions at the click of a button.",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: 'lib/pages/projects/acharya_setu/description.html'),
      HtmlSection(title: "Techstack", bodyPath: 'lib/pages/projects/acharya_setu/techstack.html'),
      HtmlSection(title: "Features", bodyPath: 'lib/pages/projects/acharya_setu/features.html'),
      HtmlSection(title: "Progress", bodyPath: 'lib/pages/projects/acharya_setu/progress.html'),
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "TechStack", subComponents: []),
      TableOfContentsComponent(title: "Features", subComponents: []),
      TableOfContentsComponent(title: "Progress", subComponents: []),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      LineIcons.toolbox,
      LineIcons.tools,
      LineIcons.award,
      EvaIcons.bulbOutline,
      EvaIcons.bulbOutline,
      EvaIcons.bulbOutline,
    ],
    buttonSecondaryColor: HexColor('#ebddff'),
    buttonPrimaryColor: HexColor('#5545d9'),
    secondaryColor: Colors.deepPurpleAccent[100]!,
    primaryColor: HexColor('#ebddff'),
  ),
  Project(
    title: ProjectNames.portfolioWebsite,
    image: 'lib/assets/images/project_banners/portfolio.png',
    source: "https://github.com/Nailsonseat/Portfolio_Website",
    pagePath: '/home/Portfolio_Website',
    briefDescription:
        "A website to showcase myself, my work and progress in a beautiful website, with easy to digest descriptions of each and every one of my project. ",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: "lib/pages/projects/portfolio_website/description.html"),
      HtmlSection(title: "Under Construction...", bodyPath: "lib/pages/templates/under_construction_template.html"),
    ],
    tableOfContents: [TableOfContentsComponent(title: "Description", subComponents: [])],
    timelineIcons: [Ionicons.bookmark_sharp, EvaIcons.fileText, Ionicons.construct, LineIcons.hardHat],
    buttonSecondaryColor: HexColor('#ffdad7'),
    buttonPrimaryColor: HexColor('#d14a3d'),
    secondaryColor: HexColor('#fe7866'),
    primaryColor: HexColor('#ffdad7'),
  ),
  Project(
    title: ProjectNames.hospitalManagementUtility,
    image: 'lib/assets/images/project_banners/hospital_management_utility.png',
    source: "https://github.com/Nailsonseat/Hospital-Management-Utility",
    pagePath: '/home/Hospital_Management_Utility',
    briefDescription:
        "A hospital management software fully implemented in C++ that keeps records of patients and assigns them a appointment time, with 30 minutes of gaps with no overlapping of appointments. This also comes with a search engine with filters to find patients. ",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: "lib/pages/projects/hospital_management_utility/description.html"),
      HtmlSection(title: "Under Construction...", bodyPath: "lib/pages/templates/under_construction_template.html"),
    ],
    tableOfContents: [TableOfContentsComponent(title: "Description", subComponents: [])],
    timelineIcons: [Ionicons.bookmark_sharp, EvaIcons.fileText, Ionicons.construct, LineIcons.hardHat],
    buttonSecondaryColor: HexColor('#d8efff'),
    buttonPrimaryColor: HexColor('#158dbf'),
    secondaryColor: HexColor('#05b2f4'),
    primaryColor: HexColor('#d8efff'),
  ),
  Project(
    title: ProjectNames.ecommerceShoppersBehaviourAndUnderstanding,
    image: 'lib/assets/images/project_banners/e_commerce_behaviour_understanding.png',
    source: "https://github.com/Nailsonseat/E-commerce-Shopper-s-Behaviour-Understanding",
    pagePath: '/home/Ecommerce_Shoppers_Behaviour_and_Understanding',
    briefDescription:
        "My first Kaggle competition. This model predicts whether a person is going to buy a product based on a variety of factors ranging from time spent on product's page to current season to user's device info and bounce and exit rates. ",
    description: '',
    sections: [
      HtmlSection(
          title: "Description",
          bodyPath: "lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/description.html"),
      HtmlSection(
          title: "Techstack",
          bodyPath: "lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/techstack.html"),
      HtmlSection(
          title: "Classifiers Used",
          bodyPath: "lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/models.html"),
      HtmlSection(
          title: "Results", bodyPath: "lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/results.html"),
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "Techstack", subComponents: []),
      TableOfContentsComponent(title: "Classifiers Used", subComponents: []),
      TableOfContentsComponent(title: "Results", subComponents: []),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      LineIcons.toolbox,
      LineIcons.tools,
      EvaIcons.cubeOutline,
      Ionicons.funnel_outline,
      Ionicons.receipt_outline,
      Ionicons.bar_chart_outline,
    ],
    buttonSecondaryColor: HexColor('#d7eff1'),
    buttonPrimaryColor: HexColor('#105952'),
    secondaryColor: HexColor('#25bcb8'),
    primaryColor: HexColor('#d7eff1'),
  ),
  Project(
    title: ProjectNames.dataIntoIPL,
    image: 'lib/assets/images/project_banners/data_in_ipl.png',
    source: "https://github.com/Nailsonseat/Data_into_IPL",
    pagePath: '/home/Data_Into_IPL',
    briefDescription:
        "This model predicts how much runs a team will score in the first 6 overs (also called power play). It uses data of players, their teams and the matches won by them, ever since the IPL started in 2008. ",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: "lib/pages/projects/data_into_ipl/description.html"),
      HtmlSection(title: "Dataset", bodyPath: "lib/pages/projects/data_into_ipl/dataset.html"),
      HtmlSection(title: "Project", bodyPath: "lib/pages/projects/data_into_ipl/project.html"),
      HtmlSection(title: "Results", bodyPath: "lib/pages/projects/data_into_ipl/results.html"),
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "Dataset", subComponents: []),
      TableOfContentsComponent(title: "Project", subComponents: []),
      TableOfContentsComponent(title: "Results", subComponents: []),
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      Ionicons.construct,
      LineIcons.hardHat,
      LineIcons.toolbox,
      LineIcons.tools,
      LineIcons.award,
      EvaIcons.bulbOutline,
    ],
    buttonSecondaryColor: HexColor('#e9f6c7'),
    buttonPrimaryColor: HexColor('#086b2a'),
    secondaryColor: HexColor('#a4da0c'),
    primaryColor: HexColor('#e9f6c7'),
  ),
  Project(
    title: ProjectNames.kastor,
    image: 'lib/assets/images/project_banners/kastor.png',
    source: "https://github.com/Nailsonseat/Kastor",
    pagePath: '/home/Kastor',
    briefDescription:
        "This is a Website that is supposed to fetch game prices from different platforms using web scraping and give you the best deal. Just like Trivago but for Games! ",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: "lib/pages/projects/kastor/description.html"),
      HtmlSection(title: "Under Construction...", bodyPath: "lib/pages/templates/under_construction_template.html"),
    ],
    tableOfContents: [TableOfContentsComponent(title: "Description", subComponents: [])],
    timelineIcons: [Ionicons.bookmark_sharp, EvaIcons.fileText, Ionicons.construct, LineIcons.hardHat],
    buttonSecondaryColor: HexColor('#f2e3dc'),
    buttonPrimaryColor: HexColor('#491d07'),
    secondaryColor: HexColor('#c17851'),
    primaryColor: HexColor('#f2e3dc'),
  ),
  Project(
    title: ProjectNames.classicSnake,
    image: 'lib/assets/images/project_banners/snake.png',
    source: "https://github.com/Nailsonseat/Classic-Snake-By-2D-Focused-Frames-per-second",
    pagePath: '/home/Classic_Snake_FFPS',
    briefDescription:
        "My first ever project! The classic snake game with a twist! It only updates the screen where data is updated. It records high score and saves it along with the options for snake customization as well!",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: "lib/pages/projects/classic_snake_ffps/description.html"),
      HtmlSection(title: "Tech Stack", bodyPath: "lib/pages/projects/classic_snake_ffps/techstack.html"),
      HtmlSection(title: "The Game", bodyPath: "lib/pages/projects/classic_snake_ffps/game.html"),
      HtmlSection(title: "Conclusion", bodyPath: "lib/pages/projects/classic_snake_ffps/conclusion.html")
    ],
    tableOfContents: [
      TableOfContentsComponent(title: "Description", subComponents: []),
      TableOfContentsComponent(title: "Tech Stack", subComponents: []),
      TableOfContentsComponent(title: "The Game", subComponents: []),
      TableOfContentsComponent(title: "Conclusion", subComponents: [])
    ],
    timelineIcons: [
      Ionicons.bookmark_sharp,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      EvaIcons.fileText,
      Ionicons.construct,
      LineIcons.hardHat
    ],
    buttonSecondaryColor: HexColor('#e7f6ee'),
    buttonPrimaryColor: HexColor('#34805b'),
    secondaryColor: HexColor('#82d0a7'),
    primaryColor: HexColor('#e7f6ee'),
  ),
  Project(
    title: ProjectNames.machineLearning,
    image: 'lib/assets/images/project_banners/machine_learning.png',
    source: "https://github.com/Nailsonseat/Machine-Learning",
    pagePath: '/home/Machine_Learning',
    briefDescription:
        "This projects has my entire machine learning journey where I hard code and implement various machine learning algorithms from scratch without using any machine learning library. ",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: "lib/pages/projects/machine_learning/description.html"),
      HtmlSection(title: "Under Construction...", bodyPath: "lib/pages/templates/under_construction_template.html"),
    ],
    tableOfContents: [TableOfContentsComponent(title: "Description", subComponents: [])],
    timelineIcons: [Ionicons.bookmark_sharp, EvaIcons.fileText, Ionicons.construct, LineIcons.hardHat],
    buttonSecondaryColor: HexColor('#e9f4ff'),
    buttonPrimaryColor: HexColor('#425fdb'),
    secondaryColor: HexColor('#8f9fef'),
    primaryColor: HexColor('#e9f4ff'),
  ),
  Project(
    title: ProjectNames.letsTalkk,
    image: 'lib/assets/images/project_banners/messaging.png',
    source: "https://github.com/Nailsonseat/LetsTalkk",
    pagePath: '/home/LetsTalkk',
    briefDescription:
        "A unique fusion of a chat app between whatsapp and discord that provides features like discord but with the easy to navigate UI of whatsapp like realtime chat apps.",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: "lib/pages/projects/letstalkk/description.html"),
      HtmlSection(title: "Under Construction...", bodyPath: "lib/pages/templates/under_construction_template.html"),
    ],
    tableOfContents: [TableOfContentsComponent(title: "Description", subComponents: [])],
    timelineIcons: [Ionicons.bookmark_sharp, EvaIcons.fileText, Ionicons.construct, LineIcons.hardHat],
    buttonSecondaryColor: HexColor('#eceffe'),
    buttonPrimaryColor: HexColor('#4764ea'),
    secondaryColor: HexColor('#5f78eb'),
    primaryColor: HexColor('#eceffe'),
  ),
  Project(
    title: ProjectNames.yoshopWebScraper,
    image: 'lib/assets/images/project_banners/yoshop_scraper.png',
    source: "https://github.com/Nailsonseat/Yoshop-Web-Scraper",
    pagePath: '/home/Yoshop_Web_Scraper',
    briefDescription:
        "A web scraping project which scraps number of products category wise. It scrapes using Beautiful Soup and Selenium like libraries.",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: "lib/pages/projects/yoshop_web_scraper/description.html"),
      HtmlSection(title: "Under Construction...", bodyPath: "lib/pages/templates/under_construction_template.html"),
    ],
    tableOfContents: [TableOfContentsComponent(title: "Description", subComponents: [])],
    timelineIcons: [Ionicons.bookmark_sharp, EvaIcons.fileText, Ionicons.construct, LineIcons.hardHat],
    buttonSecondaryColor: HexColor('#e2f8fd'),
    buttonPrimaryColor: HexColor('#431e7b'),
    secondaryColor: HexColor('#7677d2'),
    primaryColor: HexColor('#e2f8fd'),
  ),
  Project(
    title: ProjectNames.holomorphicBot,
    image: 'lib/assets/images/project_banners/hola_bot.png',
    source: "https://github.com/Nailsonseat/Hola_bot",
    pagePath: '/home/Hola_bot',
    briefDescription: "A tri-wheeler holomorphic bot that is able to traverse and move its limbs in all directions.",
    description: '',
    sections: [
      HtmlSection(title: "Description", bodyPath: "lib/pages/projects/holomorphic_bot/description.html"),
      HtmlSection(title: "Description", bodyPath: "lib/pages/templates/under_construction_template.html"),
    ],
    tableOfContents: [TableOfContentsComponent(title: "Description", subComponents: [])],
    timelineIcons: [Ionicons.bookmark_sharp, EvaIcons.fileText, Ionicons.construct, LineIcons.hardHat],
    buttonSecondaryColor: HexColor('#f7e1d7'),
    buttonPrimaryColor: HexColor('#bb512d'),
    secondaryColor: HexColor('#f29c73'),
    primaryColor: HexColor('#f7e1d7'),
  ),
];
