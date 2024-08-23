import 'package:Concours_SN/excellence_pages/cg/cg.dart';
import 'package:Concours_SN/excellence_pages/jp/jp.dart';
import 'package:Concours_SN/excellence_pages/lsed/lsed.dart';
import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';

class ChoixExcellence extends StatefulWidget {
  const ChoixExcellence({super.key});

  @override
  State<ChoixExcellence> createState() => _ChoixExcellenceState();
}

class _ChoixExcellenceState extends State<ChoixExcellence> {
  Map<String, String> allConcours = {
    'Concours Général': 'cg',
    'Junior Polytech': 'jp',
    'Lycée d\'Excellence Diourbel': 'lsed'
  };

  // Map abbreviations to widgets
  final Map<String, Widget> concoursWidgets = {
    'cg': const Home_CG(),
    'jp': const Home_JP(),
    'lsed': const Home_LSED()
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
            "Concours d'Excellence",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: allConcours.keys.map((school) {
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
                    String abbreviation = allConcours[school]!;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => concoursWidgets[abbreviation]!),
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
