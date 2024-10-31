import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/photo_gallery_screen.dart';
import 'package:portfolio/professional_screen.dart';
import 'package:portfolio/theme_constants.dart';

void main() {
  runApp(const MyHomePage());
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showPhotoPortfolio = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: "Royam Jain Portfolio",
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text("Portfolio",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.purple.shade200,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.montserrat().fontFamily)),
              ],
            ),
            actions: [
              //linkedin
              //github
              //contact
              // const Row(
              //   children: [
              //     Icon(Icons.perm_contact_cal),
              //     SizedBox(
              //       width: 5,
              //     ),
              //     SelectableText(
              //       "+91 7733007245"
              //     ),
              //   ],
              // ),
              // const Row(
              //   children: [
              //     Icon(Icons.mail),
              //     SizedBox(
              //       width: 5,
              //     ),
              //     SelectableText(
              //         "royamjain@gmail.com"
              //     ),
              //   ],
              // ),
              const SizedBox(
                width: 70,
              ),
              Text(
                "Software",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: pinkSwitch,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
              const SizedBox(
                width: 10,
              ),
              Transform.scale(
                scale: 0.7,
                child: Switch(
                    activeColor: colorWhite,
                    activeTrackColor: orangeSwitch,
                    inactiveThumbColor: colorWhite,
                    inactiveTrackColor: pinkSwitch,
                    thumbIcon: showPhotoPortfolio
                        ? WidgetStateProperty.all(Icon(Icons.camera_alt, color: pinkSwitch,))
                        : WidgetStateProperty.all(Icon(Icons.adjust, color: orangeSwitch,)),
                    value: showPhotoPortfolio,
                    trackOutlineWidth: WidgetStateProperty.all(0),
                    onChanged: (bool check) {
                      setState(() {
                        showPhotoPortfolio = !showPhotoPortfolio;
                      });
                    }),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Photo gallery",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: orangeSwitch,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          body: IndexedStack(
            index: showPhotoPortfolio ? 1 : 0,
            children: const [
              ProfessionalScreen(),
              PhotoGalleryScreen(),
            ],
          )
        ),
      ),
    );
  }
}
