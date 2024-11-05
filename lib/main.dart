import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/photo_gallery_screen.dart';
import 'package:portfolio/professional_screen.dart';
import 'package:portfolio/constants.dart';

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

  switchBar(){
    setState(() {
      showPhotoPortfolio = !showPhotoPortfolio;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: MaterialApp(
        title: "Royam Jain Portfolio",
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text("Portfolio",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: purple,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.montserrat().fontFamily)),
              ],
            ),
            actions: [
              const SizedBox(
                width: 70,
              ),
              if(width >= 800)Text(
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
                        : WidgetStateProperty.all(Icon(Icons.laptop_windows_sharp, color: orangeSwitch,)),
                    value: showPhotoPortfolio,
                    trackOutlineWidth: WidgetStateProperty.all(0),
                    onChanged: (bool check) {
                      switchBar();
                    }),
              ),
              const SizedBox(
                width: 10,
              ),
              if(width >= 800)Text(
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
            children: [
              ProfessionalScreen(callback: switchBar,),
              const PhotoGalleryScreen(),
            ],
          )
        ),
      ),
    );
  }
}
