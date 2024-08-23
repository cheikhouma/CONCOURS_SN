import 'package:flutter/material.dart';
import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:Concours_SN/entree_pages/ept.dart'; // Import the widget for EPT
import 'package:Concours_SN/entree_pages/esp.dart'; // Import the widget for ESP
import 'package:Concours_SN/entree_pages/ensa.dart'; // Import the widget for ENSA
import 'package:Concours_SN/entree_pages/ipsl.dart'; // Import the widget for IPSL
import 'package:Concours_SN/entree_pages/pd.dart'; // Import the widget for PD

class ChoixEntree extends StatefulWidget {
  const ChoixEntree({super.key});

  @override
  State<ChoixEntree> createState() => _ChoixEntreeState();
}

class _ChoixEntreeState extends State<ChoixEntree> {
  Map<String, String> allSchools = {
    'École Polytechnique de Thiés': 'ept',
    'École Supérieure Polytechnique': 'esp',
    'École Nationale Supérieure de l\'Agronomie': 'ensa',
    'Institut Polytechnique de Saint Louis': 'ipsl',
    'Polytech Diamniadio': 'pd'
  };

  // Map abbreviations to widgets
  final Map<String, Widget> schoolWidgets = {
    'ept': const Home_EPT(),
    'esp': const Home_ESP(),
    'ensa': const Home_ENSA(),
    'pd': const Home_PD(),
    'ipsl': const Home_IPSL()
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
            "Concours d'Entrée",
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
          children: allSchools.keys.map((school) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                width: 360, // Set the desired uniform width here
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: principale_color,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () {
                    String abbreviation = allSchools[school]!;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => schoolWidgets[abbreviation]!),
                    );
                  },
                  child: Center(
                    child: Text(
                      school,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
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
