import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Certification {
  final String title;
  final Link link;

  Certification({
    required this.title,
    required this.link,
  });
}

class CertificationWidget extends StatefulWidget {
  const CertificationWidget({super.key});

  @override
  CertificationWidgetState createState() => CertificationWidgetState();
}

class CertificationWidgetState extends State<CertificationWidget> with SingleTickerProviderStateMixin {
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
    //TODO: make different views for web and mobile
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (Certification certi in certificates)
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
                  Text(certi.title),
                  InkWell(
                      onTap: () {
                        _launchUrl(certi.link.link);
                      },
                      child: Text(
                        certi.link.displayText,
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
