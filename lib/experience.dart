import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/constants.dart';

class Experience {
  final String yearRange;
  final String title;
  final String description;
  final String company;
  final List<String> points;

  Experience(
      {required this.yearRange,
      required this.title,
      required this.description,
      required this.company,
      required this.points});
}

class ExperienceWidget extends StatefulWidget {
  final List<Experience> experiences;

  const ExperienceWidget({super.key, required this.experiences});

  @override
  ExperienceWidgetState createState() => ExperienceWidgetState();
}

class ExperienceWidgetState extends State<ExperienceWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              for (int i = 0; i < widget.experiences.length; i++)
                createTileWidget(i, i == widget.experiences.length - 1, i == 0)
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(flex: 1, child: createDetailWidget())
      ],
    );
  }

  Widget createTileWidget(int index, bool isLast, bool isFirst) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            selectedIndex == index
                ? Icon(
                    Icons.fiber_manual_record,
                    fill: 1,
                    color: yellow,
                  )
                : Icon(
                    Icons.fiber_manual_record_outlined,
                    color: pinkSwitch,
                  ),
          ],
        ),
        // Icon(Icons.),
        const SizedBox(width: 16),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundBlack,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: selectedIndex == index ? yellow : pinkSwitch,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.experiences[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: orangeSwitch, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.experiences[index].yearRange,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.experiences[index].description,
                    style: TextStyle(
                      fontSize: 14,
                      color: colorWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget createDetailWidget() {
    return Animate(
        key: UniqueKey(),
        autoPlay: true,
        delay: const Duration(seconds: 0),
        effects: const [
          FadeEffect(duration: Duration(milliseconds: 300)),
          SlideEffect(begin: Offset(100, 0), curve: Curves.easeInOut, duration: Duration(milliseconds: 300)),
        ],
        child: Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundBlack,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: yellow,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.experiences[selectedIndex].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "  @${widget.experiences[selectedIndex].company}",
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 14,
                        color: colorWhite,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    for (String point in widget.experiences[selectedIndex].points)
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.adjust,
                                color: orangeSwitch,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text(
                                point,
                                softWrap: true,
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                  ],
                ),
                // SizedBox(
                //   height: 300,
                //   child: ListView.builder(
                //     itemCount: widget.experiences[selectedIndex].points.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Expanded(
                //         child: Row(
                //           children: [
                //             Icon(Icons.adjust),
                //             Text(widget.experiences[selectedIndex].points[index], softWrap: true,)
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ));
    // return Expanded(
    //   child: Container(
    //     margin: const EdgeInsets.only(bottom: 16),
    //     padding: const EdgeInsets.all(16),
    //     decoration: BoxDecoration(
    //       color: backgroundBlack,
    //       borderRadius: BorderRadius.circular(8),
    //       border: Border.all(
    //         width: 2,
    //         color: pinkSwitch,
    //       ),
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //             Text(
    //               widget.experiences[selectedIndex].title,
    //               style: Theme.of(context).textTheme.titleMedium,
    //             ),
    //             Text(
    //               "  @${widget.experiences[selectedIndex].company}",
    //               softWrap: true,
    //               style: TextStyle(
    //                 fontSize: 14,
    //                 color: colorWhite,
    //               ),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(height: 30,),
    //         Column(
    //           children: [
    //             for (String point in widget.experiences[selectedIndex].points)
    //               Column(
    //                 children: [
    //                   Row(
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Icon(
    //                         Icons.adjust,
    //                         color: orangeSwitch,
    //                         size: 20,
    //                       ),
    //                       const SizedBox(width: 10,),
    //                       Expanded(
    //                           child: Text(
    //                         point,
    //                         softWrap: true,
    //                       ))
    //                     ],
    //                   ),
    //                   const SizedBox(height: 10,),
    //                 ],
    //               )
    //           ],
    //         ),
    //         // SizedBox(
    //         //   height: 300,
    //         //   child: ListView.builder(
    //         //     itemCount: widget.experiences[selectedIndex].points.length,
    //         //     itemBuilder: (BuildContext context, int index) {
    //         //       return Expanded(
    //         //         child: Row(
    //         //           children: [
    //         //             Icon(Icons.adjust),
    //         //             Text(widget.experiences[selectedIndex].points[index], softWrap: true,)
    //         //           ],
    //         //         ),
    //         //       );
    //         //     },
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
