import 'package:flutter/material.dart';

class ProfessionalScreen extends StatefulWidget {
  const ProfessionalScreen({super.key});

  @override
  State<ProfessionalScreen> createState() => _ProfessionalScreenState();
}

class _ProfessionalScreenState extends State<ProfessionalScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black87,
        child: const Center(
          child: Text("PROFESSIONAL",),
        )
    );
  }
}