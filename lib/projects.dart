import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Project {
  final String title;
  final String description;
  final List<String> points;
  final List<String> techStack;
  final List<String>? images;
  final List<Link>? links;

  // title, description, details.., ...techStack, ...images

  Project({
    required this.title,
    required this.description,
    required this.points,
    required this.techStack,
    this.images,
    this.links,
  });
}

class Link {
  final String displayText;
  final String link;

  Link({
    required this.displayText,
    required this.link,
  });
}

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({super.key});

  @override
  ProjectWidgetState createState() => ProjectWidgetState();
}

class ProjectWidgetState extends State<ProjectWidget> {
  int selectedIndex = 0;
  late double width;
  late bool isWebView = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.sizeOf(context).width;
    isWebView = width >= 800 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (screenWidth < 600) {
      crossAxisCount = 1;
    } else if (screenWidth < 900) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }

    const double cardHeight = 250;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: screenWidth / (cardHeight * crossAxisCount),
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () {
              selectedIndex = index;
              expandedView();
            },
            child: Card(
                color: backgroundBlack,
                shadowColor: pinkSwitch,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: backgroundBlack,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: pinkSwitch,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projects[index].title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: orangeSwitch),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        projects[index].description,
                        softWrap: true,
                        style: Theme.of(context).textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }

  Future expandedView() {
    return showDialog(
        context: context,
        builder: (context) {
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
                          projects[selectedIndex].title,
                          style: Theme.of(context).textTheme.titleLarge,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'About - ${projects[selectedIndex].description}',
                      style: Theme.of(context).textTheme.titleMedium,
                      // overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    for (String point in projects[selectedIndex].points)
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
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: projects[selectedIndex]
                            .techStack
                            .map(
                              (tech) => Chip(
                                label: Text(tech),
                                backgroundColor: backgroundBlack,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                side: BorderSide(color: pinkSwitch, width: 2),
                                labelStyle:
                                    Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                            )
                            .toList()),
                    const SizedBox(
                      height: 30,
                    ),
                    Visibility(
                      visible: projects[selectedIndex].links?.isNotEmpty ?? false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Relevant links below',
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          for (Link link in projects[selectedIndex].links ?? [])
                            InkWell(
                              onTap: () {
                                _launchUrl(link.link);
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.link, color: orangeSwitch,),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        link.displayText,
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: orangeSwitch),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
