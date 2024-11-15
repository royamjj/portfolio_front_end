import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Publication {
  final String title;
  final Link link;

  Publication({
    required this.title,
    required this.link,
  });
}

class PublicationWidget extends StatefulWidget {
  const PublicationWidget({super.key});

  @override
  PublicationWidgetState createState() => PublicationWidgetState();
}

class PublicationWidgetState extends State<PublicationWidget> with SingleTickerProviderStateMixin {
  late double width;
  late bool isWebView = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.sizeOf(context).width;
    isWebView = width >= 800 ? true : false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (Publication pub in publications)
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: backgroundBlack,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2,
                    color: pinkSwitch,
                  ),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Text(pub.title),
                    InkWell(
                      onTap: () {
                        _launchUrl(pub.link.link);
                      },
                      child: Text(
                        pub.link.displayText,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: animationOrange),
                        overflow: TextOverflow.ellipsis,
                      ),),
                  ],),
              ),
              const SizedBox(height: 10,)
            ],
          )
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
