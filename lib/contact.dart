import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact {
  final Link link;
  final Icon icon;

  Contact({
    required this.link,
    required this.icon,
  });
}

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  ContactWidgetState createState() => ContactWidgetState();
}

class ContactWidgetState extends State<ContactWidget> with SingleTickerProviderStateMixin {
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
    return Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: contacts
            .map(
              (contact) => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: InkWell(
                  onTap: () {
                    _launchUrl(contact.link.link);
                  },
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
                    constraints: BoxConstraints(maxWidth: 250),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact.link.displayText,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: orangeSwitch),
                        ),
                        const SizedBox(height: 10),
                        contact.icon
                      ],
                    ),
                  ),
                ),
              ),
        )
            .toList());
  }

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
