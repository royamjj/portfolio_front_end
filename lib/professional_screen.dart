import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/certification.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/projects.dart';
import 'package:portfolio/publication.dart';

import 'experience.dart';

class ProfessionalScreen extends StatefulWidget {
  Function? callback;

  ProfessionalScreen({super.key, this.callback});

  @override
  State<ProfessionalScreen> createState() => _ProfessionalScreenState();
}

class _ProfessionalScreenState extends State<ProfessionalScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Container(
        height: height,
        width: width,
        color: Colors.black,
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
                    decoration:
                        BoxDecoration(gradient: LinearGradient(colors: [purple, orangeSwitch], stops: [value, 1])),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            width >= 800 ? width * 0.1 : 30, 50, width >= 800 ? width * 0.1 : 30, 0),
                        child: getBioWidget(width))),
              ),
              const SizedBox(
                height: 50,
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [
                          0.0,
                          1.0,
                        ],
                        colors: [
                          animationRed,
                          animationOrange
                        ],
                        transform: GradientRotation(_controller.value * 2 * 3.1415),
                      ).createShader(bounds);
                    },
                    child: child,
                  );
                },
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(width >= 800 ? width * 0.1 : 30, 40, width >= 800 ? width * 0.1 : 30, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Experience", style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(
                        height: 30,
                      ),
                      const ExperienceWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      Text("Projects", style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(
                        height: 30,
                      ),
                      const ProjectWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      Text("Certifications", style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(
                        height: 30,
                      ),
                      const CertificationWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      Text("Publications", style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(
                        height: 30,
                      ),
                      const PublicationWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      Text("Contact", style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(
                        height: 30,
                      ),
                      const ContactWidget(),
                    ],
                  ),
                ),
              ),
              //contact
            ],
          ),
        ));
  }

  Widget getBioWidget(double width) {
    if (width >= 800) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [...getBioTextWidgets()],
                ),
              ),
              getImageWidget(width),
            ],
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          goToPhotosWidget(),
          const SizedBox(
            height: 50,
          ),
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
        ...getBioTextWidgets(),
        const SizedBox(
          height: 30,
        ),
        goToPhotosWidget(),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget goToPhotosWidget() {
    return Animate(
        autoPlay: true,
        delay: const Duration(milliseconds: 500),
        effects: const [
          FadeEffect(duration: Duration(seconds: 0, milliseconds: 500)),
          SlideEffect(
              begin: Offset(-100, 0), curve: Curves.easeInOut, duration: Duration(seconds: 0, milliseconds: 500)),
        ],
        child: ElevatedButton(
            onPressed: () {
              widget.callback!();
            },
            child: const Text("Go to photos")));
  }

  List<Widget> getBioTextWidgets() {
    return [
      Animate(
          autoPlay: true,
          effects: [
            const FadeEffect(duration: Duration(seconds: 0, milliseconds: 500)),
            const SlideEffect(
                begin: Offset(-100, 0), curve: Curves.easeInOut, duration: Duration(seconds: 0, milliseconds: 500)),
            TintEffect(color: colorWhite)
          ],
          child: const SelectableText(
            "Hi, i am",
            style: TextStyle(
              fontSize: 20,
            ),
          )),
      Animate(
        autoPlay: true,
        delay: const Duration(milliseconds: 300),
        effects: [
          const FadeEffect(duration: Duration(seconds: 0, milliseconds: 500)),
          const SlideEffect(
              begin: Offset(-100, 0), curve: Curves.easeInOut, duration: Duration(seconds: 0, milliseconds: 500)),
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
            const FadeEffect(duration: Duration(seconds: 0, milliseconds: 500)),
            const SlideEffect(
                begin: Offset(-100, 0), curve: Curves.easeInOut, duration: Duration(seconds: 0, milliseconds: 500)),
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
