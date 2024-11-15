import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/link.dart';
import 'package:portfolio/projects.dart';
import 'package:portfolio/publication.dart';
import 'package:simple_icons/simple_icons.dart';

import 'certification.dart';
import 'contact.dart';
import 'experience.dart';

final Color colorWhite = HexColor("FFFFFF");
final Color black = HexColor("25252E");
final Color loadingGrey = HexColor("E8E8ED");
final Color backgroundBlack = HexColor("1f1e1e");
final Color orangeSwitch = HexColor("ed8554");
final Color pinkSwitch = HexColor("be375f");
final Color purple = HexColor("b04ec3");
final Color darkPurple = HexColor("883f96");
final Color yellow = HexColor("e7de76");
final Color animationRed = HexColor("FE5858");
final Color animationOrange = HexColor("EE9617");

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: colorWhite,
  primaryColor: colorWhite,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundBlack,
    foregroundColor: colorWhite,
  ),
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold, color: colorWhite),
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: colorWhite),
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: colorWhite),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: colorWhite),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: colorWhite),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: colorWhite),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: colorWhite),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: colorWhite),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: colorWhite),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: colorWhite),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: colorWhite),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: colorWhite),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: colorWhite),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: colorWhite),
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w300, color: colorWhite),
  ),
);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

final List<Experience> experiences = [
  Experience(
    yearRange: "July 2023 - October 2023",
    company: "Brane Enterprises",
    title: "Associate Solution Leader",
    points: [
      "Designed and implemented the back-end architecture for a Low-Code/No-Code Site builder, speeding process of app development to 80%, in Spring Boot, the platform allows users to build apps using a drag-and-drop interface, with role-based access control for enhanced security.",
      "Optimized API payloads in a back-end system, reducing payload size by 90%, which led to a significant improvement in load times, cutting them down by 90%.",
      "Optimized multiple repositories across multiple micro-services by restructuring and decoupling tightly coupled modules, significantly improved code efficiency, enhanced scalability and maintainability.",
      "Enhanced system performance by integrating Redis for efficient caching and implementing asynchronous processing with RabbitMQ, reducing latency by 40%and significantly improving user experience",
      "Fixed 30+ critical issues and reduced technical debt across integrated systems, boosting system stability and ensuring smoother performance.",
      "Executed design patterns to streamline development, enhancing code re-usability and long-term maintainability.",
    ],
    description:
        "Made impactful contributions to backend architecture, optimizing system performance and scalability for a low-code platform. Focused on enhancing user experience, reducing technical debt, and delivering a stable, efficient solution for clients.",
  ),
  Experience(
    yearRange: "Jan 2023 - June 2023",
    company: "Brane Enterprises",
    title: "Associate Solution Leader Intern",
    points: [
      "Implemented offline-first functionality from inception, reducing internet dependency and improving load times by 60%, ensuring seamless data availability and synchronization when reconnected.",
      "Used Flutter and Dart for cross-platform development, working with Java, Spring, REST APIs, BLoC, and Docker. Played a key role in developing 10+ production-ready apps for Android, iOS, Windows, and Mac",
      "Integrated the Mapper Engine with adapters, achieving a 35% increase in data processing efficiency and enabling seamless external-to-internal data mapping.",
      "Engineered multiple high-performance adapters, seamlessly integrating various services and systems to enhance scalability and ensure smooth data flow across the architecture."
    ],
    description: "Started my career as an intern at Brane, contributed many new features, and functionalities",
  ),
];

final List<Project> projects = [
  Project(
    title: "Take Care",
    description: "Monitoring and Control of COVID Vaccine Storage Temperature Using IoT and Machine Learning",
    points: [
      "An IoT and Machine Learning system developed for monitoring and controlling temperature of COVID-19 vaccine storage rooms, IEEE paper ready explanation and documentation",
      "The proposed system addresses the crucial need for real-time vaccine storage temperature monitoring, using an LED and buzzer alert to notify workers instantly, preventing temperature-related vaccine spoilage.",
      "Unlike prior systems, this model focuses specifically on vaccine safety, ensuring vaccines remain effective and available to serve the public in high volumes.",
      "Future enhancements could leverage advanced ML algorithms, solar power for independence, and Raspberry Pi or updated embedded systems for scalability. Additionally, a custom dashboard with web tools (e.g., React, NodeJS, Django) could enable remote monitoring and control, improving accessibility and usability."
    ],
    techStack: ["Python", "Virtual Machine", "ReactJS"],
    links: [Link(displayText: "Open Publication", link: "https://ieeexplore.ieee.org/document/9740740")],
  ),
  Project(
    title: "Take Care",
    description: "Monitoring and Control of COVID Vaccine Storage Temperature Using IoT and Machine Learning",
    points: [
      "An IoT and Machine Learning system developed for monitoring and controlling temperature of COVID-19 vaccine storage rooms, IEEE paper ready explanation and documentation",
      "The proposed system addresses the crucial need for real-time vaccine storage temperature monitoring, using an LED and buzzer alert to notify workers instantly, preventing temperature-related vaccine spoilage.",
      "Unlike prior systems, this model focuses specifically on vaccine safety, ensuring vaccines remain effective and available to serve the public in high volumes.",
      "Future enhancements could leverage advanced ML algorithms, solar power for independence, and Raspberry Pi or updated embedded systems for scalability. Additionally, a custom dashboard with web tools (e.g., React, NodeJS, Django) could enable remote monitoring and control, improving accessibility and usability."
    ],
    techStack: ["Python", "Virtual Machine", "ReactJS"],
    links: [Link(displayText: "Open Publication", link: "https://ieeexplore.ieee.org/document/9740740")],
  ),
  Project(
    title: "Take Care",
    description: "Monitoring and Control of COVID Vaccine Storage Temperature Using IoT and Machine Learning",
    points: [
      "An IoT and Machine Learning system developed for monitoring and controlling temperature of COVID-19 vaccine storage rooms, IEEE paper ready explanation and documentation",
      "The proposed system addresses the crucial need for real-time vaccine storage temperature monitoring, using an LED and buzzer alert to notify workers instantly, preventing temperature-related vaccine spoilage.",
      "Unlike prior systems, this model focuses specifically on vaccine safety, ensuring vaccines remain effective and available to serve the public in high volumes.",
      "Future enhancements could leverage advanced ML algorithms, solar power for independence, and Raspberry Pi or updated embedded systems for scalability. Additionally, a custom dashboard with web tools (e.g., React, NodeJS, Django) could enable remote monitoring and control, improving accessibility and usability."
    ],
    techStack: ["Python", "Virtual Machine", "ReactJS"],
    links: [Link(displayText: "Open Publication", link: "https://ieeexplore.ieee.org/document/9740740")],
  ),
  Project(
    title: "Take Care",
    description: "Monitoring and Control of COVID Vaccine Storage Temperature Using IoT and Machine Learning",
    points: [
      "An IoT and Machine Learning system developed for monitoring and controlling temperature of COVID-19 vaccine storage rooms, IEEE paper ready explanation and documentation",
      "The proposed system addresses the crucial need for real-time vaccine storage temperature monitoring, using an LED and buzzer alert to notify workers instantly, preventing temperature-related vaccine spoilage.",
      "Unlike prior systems, this model focuses specifically on vaccine safety, ensuring vaccines remain effective and available to serve the public in high volumes.",
      "Future enhancements could leverage advanced ML algorithms, solar power for independence, and Raspberry Pi or updated embedded systems for scalability. Additionally, a custom dashboard with web tools (e.g., React, NodeJS, Django) could enable remote monitoring and control, improving accessibility and usability."
    ],
    techStack: ["Python", "Virtual Machine", "ReactJS"],
    links: [
      Link(displayText: "Open Publication", link: "https://ieeexplore.ieee.org/document/9740740"),
      Link(displayText: "Open Publication", link: "https://ieeexplore.ieee.org/document/9740740"),
      Link(displayText: "Open Publication", link: "https://ieeexplore.ieee.org/document/9740740"),
      Link(displayText: "Open Publication", link: "https://ieeexplore.ieee.org/document/9740740")
    ],
  ),
];

final List<Certification> certificates = [
  Certification(
      title: "Participated in SCEECS 2022",
      link: Link(
          displayText: "Certificate",
          link: "https://drive.google.com/file/d/1y7jhX_Y4LgywCfiEtM39dVhpva-fZOXv/view?usp=sharing")),
  Certification(
      title: "The Arduino Platform and C Programming",
      link: Link(
          displayText: "Certificate",
          link: "https://drive.google.com/file/d/1Fra-N_t8e-jbKOYqsOqQx78vUXaaRBNz/view?usp=sharing")),
  Certification(
      title: "Front-End Web Development with React",
      link: Link(
          displayText: "Certificate",
          link: "https://drive.google.com/file/d/1rVEb0MmLUqUhOaxolsZqH16zfRw5_L9P/view?usp=sharing")),
  Certification(
      title: "Introduction to the Internet of Things and Embedded Systems",
      link: Link(
          displayText: "Certificate",
          link: "https://drive.google.com/file/d/1MOYJMFnrBOEjwSatMKrTiUWudD8ROFEr/view?usp=sharing")),
  Certification(
      title: "Internshala Internet of Things workshop",
      link: Link(
          displayText: "Certificate",
          link: "https://drive.google.com/file/d/1wTtxPDIgmKm2w18sEHUVMvAnfYADp4br/view?usp=sharing")),
  Certification(
      title: "Codathon 2022",
      link: Link(
          displayText: "Certificate",
          link: "https://drive.google.com/file/d/1frq6XU81mqV8N9Bh_BqcJBeFX9CkWzeA/view?usp=sharing")),
  Certification(
      title: "Crash Course on Python",
      link: Link(
          displayText: "Certificate",
          link: "https://drive.google.com/file/d/1rIglK-h8vrQfbfHsnWTDozu5SJ44_kFo/view?usp=sharing")),
];

final List<Publication> publications = [
  Publication(
      title: "Monitoring and Control of COVID Vaccine Storage Temperature Using IoT and Machine Learning",
      link: Link(displayText: "Link to publication", link: "https://ieeexplore.ieee.org/document/9740740")),
];

final List<Contact> contacts = [
  Contact(
      link: Link(displayText: "Github", link: "https://github.com/royamjj"),
      icon: Icon(
        SimpleIcons.github,
        color: orangeSwitch,
      )),
  Contact(
      link: Link(displayText: "LinkedIn", link: "https://www.linkedin.com/in/rj00114/"),
      icon: Icon(
        SimpleIcons.linkedin,
        color: orangeSwitch,
      )),
  Contact(
      link: Link(
          displayText: "Gmail",
          link: Uri(
            scheme: 'mailto',
            path: "royamjain@gmail.com",
          ).path),
      icon: Icon(
        SimpleIcons.gmail,
        color: orangeSwitch,
      )),
  Contact(
      link: Link(displayText: "+91 7733007245", link: "+91 7733007245"),
      icon: Icon(
        Icons.contacts,
        color: orangeSwitch,
      )),
];
