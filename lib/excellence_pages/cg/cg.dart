import 'package:Concours_SN/excellence_pages/cg/cg_premiere.dart';
import 'package:Concours_SN/excellence_pages/cg/cg_terminale.dart';
import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';

class Home_CG extends StatefulWidget {
  const Home_CG({super.key});

  @override
  State<Home_CG> createState() => _Home_CGState();
}

class _Home_CGState extends State<Home_CG> {
  Map<String, String> allLevel = {
    'Première': 'pre',
    'Terminale': 'ter',
  };
  final Map<String, Widget> concoursWidgets = {
    'pre': const Home_CG_Premiere(),
    'ter': const Home_CG_Terminale(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: principale_color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: white), // Change color to black
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: const Center(
          child: Text(
            "ÉPREUVES CG",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: allLevel.keys.map((school) {
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
                    String abbreviation = allLevel[school]!;
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
