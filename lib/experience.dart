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

  const ExperienceWidget({super.key});

  @override
  ExperienceWidgetState createState() => ExperienceWidgetState();
}

class ExperienceWidgetState extends State<ExperienceWidget> {
  int selectedIndex = 0;
  late double width;
  late bool isWebView = false;

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    width = MediaQuery.sizeOf(context).width;
    isWebView = width >= 800 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              for (int i = 0; i < experiences.length; i++)
                createTileWidget(i, i == experiences.length - 1, i == 0)
            ],
          ),
        ),
        if(isWebView)
        const SizedBox(
          width: 20,
        ),
        if(isWebView)Expanded(flex: 1, child: createDetailWidget())
      ],
    );
  }

  Future dialogDetailsWidget(){
    return showDialog(context: context, builder: (context){
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: backgroundBlack,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              color: pinkSwitch,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      experiences[selectedIndex].title,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.clear,
                          color: colorWhite,
                        ))
                  ],
                ),
                Text(
                  "@${experiences[selectedIndex].company}",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 14,
                    color: colorWhite,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    for (String point in experiences[selectedIndex].points)
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
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget createTileWidget(int index, bool isLast, bool isFirst) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(isWebView)Column(
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
        if(isWebView)const SizedBox(width: 16),
        Expanded(
          child: InkWell(
            onTap: () {
              if(isWebView){
                setState(() {
                  selectedIndex = index;
                });
              }else{
                selectedIndex = index;
                dialogDetailsWidget();
              }
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundBlack,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: isWebView && selectedIndex == index ? yellow : pinkSwitch,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          experiences[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: orangeSwitch, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        experiences[index].yearRange,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    experiences[index].description,
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
                  Expanded(
                    child: Text(
                      experiences[selectedIndex].title,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "  @${experiences[selectedIndex].company}",
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
                  for (String point in experiences[selectedIndex].points)
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
            ],
          ),
        ));
  }
}
