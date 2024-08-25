import 'package:Concours_SN/excellence_pages/jp/subjects/premiere/cons_meca.dart';
import 'package:Concours_SN/excellence_pages/jp/subjects/premiere/maths.dart';
import 'package:Concours_SN/excellence_pages/jp/subjects/premiere/physique.dart';
import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';

class Home_CG_Premiere extends StatefulWidget {
  const Home_CG_Premiere({super.key});

  @override
  State<Home_CG_Premiere> createState() => _Home_CG_PremiereState();
}

class _Home_CG_PremiereState extends State<Home_CG_Premiere> {
  Map<String, String> allSubjects = {
    'Mathématiques': 'maths',
    'Physique': 'pc',
    'Cons Méca': 'cm'
  };

  // Map abbreviations to widgets
  final Map<String, Widget> subjectsWidgets = {
    'maths': const Home_JP_Premiere_Math(),
    'pc': const Home_JP_Premiere_Physique(),
    'cm': const Home_JP_Premiere_ConsMeca()
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: white), // Change color to black
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        backgroundColor: principale_color,
        title: const Center(
          child: Text(
            "CG Première",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: allSubjects.keys.map((school) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: 360,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: principale_color,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () {
                    String abbreviation = allSubjects[school]!;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => subjectsWidgets[abbreviation]!),
                    );
                  },
                  child: Center(
                    child: Text(
                      school,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
