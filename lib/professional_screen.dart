import 'package:flutter/material.dart';

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
        color: Colors.black87,
        child: Padding(
          padding: EdgeInsets.fromLTRB(width >= 800 ? 100 : 30, 50, width >= 800 ? 100 : 30, 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.fromLTRB(100, 0, 100, 0), child: getBioWidget(width)),
              ],
            ),
          ),
        ));
  }

  Widget getBioWidget(double width) {
    if (width >= 800) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  "Hi, i am",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SelectableText(
                  "Royam Jain",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                SelectableText(
                  "Professional Software Engineer and a newbie photographer",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/profile_pic.png",
            width: 200,
            height: 200,
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/profile_pic.png",
          width: 100,
          height: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        const SelectableText(
          "Hi, i am",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SelectableText(
          "Royam Jain",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        const SelectableText(
          "Professional Software Engineer and a newbie photographer",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
