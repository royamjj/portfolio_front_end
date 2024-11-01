import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/constants.dart';

import 'experience.dart';

class ProfessionalScreen extends StatefulWidget {
  const ProfessionalScreen({super.key});

  @override
  State<ProfessionalScreen> createState() => _ProfessionalScreenState();
}

class _ProfessionalScreenState extends State<ProfessionalScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
        height: height,
        width: width,
        color: backgroundBlack,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Animate().custom(
                duration: 1.seconds,
                begin: 0,
                end: 0.4,
                builder: (_, value, __) => Container(
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [purple, orangeSwitch], stops: [value, 1])),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(width >= 800 ? 150 : 50, 50, width >= 800 ? 150 : 50, 50),
                        child: getBioWidget(width))),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(width >= 800 ? 100 : 30, 0, width >= 800 ? 100 : 30, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Experience", style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(
                      height: 50,
                    ),
                    ExperienceWidget(
                      experiences: experiences,
                    ),
                  ],
                ),
              ),
              //projects
              //resume
              //certificates
              //contact
            ],
          ),
        ));
  }

  Widget getBioWidget(double width) {
    if (width >= 800) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...getBioTextWidgets()
              ],
            ),
          ),
          getImageWidget(width),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getImageWidget(width),
        const SizedBox(
          height: 10,
        ),
        ...getBioTextWidgets()
      ],
    );
  }

  List<Widget> getBioTextWidgets(){
    return [
      Animate(
          autoPlay: true,
          delay: const Duration(seconds: 0),
          effects: [
            const FadeEffect(duration: Duration(seconds: 1,milliseconds: 500)),
            const SlideEffect(begin: Offset(-100, 0), curve: Curves.easeInOut,duration: Duration(seconds: 1,milliseconds: 300)),
            TintEffect(color: colorWhite)
          ],
          child: const SelectableText(
            "Hi, i am",
            style: TextStyle(
              fontSize: 20,
            ),
          )
      ),
      Animate(
        autoPlay: true,
        delay: const Duration(milliseconds: 300),
        effects: [
          const FadeEffect(duration: Duration(seconds: 1,milliseconds: 300)),
          const SlideEffect(begin: Offset(-100, 0), curve: Curves.easeInOut,duration: Duration(seconds: 1,milliseconds: 300)),
          TintEffect(color: colorWhite)
        ],
        child: const SelectableText(
          "Royam Jain",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      Animate(
          autoPlay: true,
          delay: const Duration(milliseconds: 500),
          effects: [
            const FadeEffect(duration: Duration(seconds: 1, milliseconds: 300)),
            const SlideEffect(begin: Offset(-100, 0), curve: Curves.easeInOut,duration: Duration(seconds: 1,milliseconds: 300)),
            TintEffect(color: colorWhite)
          ],
          child: const SelectableText(
            "Professional Software Engineer and a newbie photographer",
            style: TextStyle(
              fontSize: 24,
            ),
          )),
    ];
  }

  Widget getImageWidget(double screenWidth) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: screenWidth >= 800 ? 200 : 120,
          height: screenWidth >= 800 ? 200 : 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [orangeSwitch, pinkSwitch, orangeSwitch],
              radius: 0.8,
              center: Alignment.center,
            ),
          ),
        ),
        ClipOval(
          child: Image.asset(
            "assets/avatar.png",
            width: screenWidth >= 800 ? 180 : 110,
            height: screenWidth >= 800 ? 180 : 110,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
