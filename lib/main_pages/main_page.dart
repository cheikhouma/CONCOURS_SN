// ignore_for_file: prefer_const_constructors

import 'package:Concours_SN/main_pages/choix_entree.dart';
import 'package:Concours_SN/main_pages/choix_excellence.dart';
import 'package:Concours_SN/main_pages/info_dev.dart'; // Import de la page InfoDevPage
import 'package:flutter/material.dart';
import 'package:Concours_SN/main_pages/constantes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, String> allType = {
    'Concours d\'entrée': 'cen',
    'Concours d\'excellence': 'cex',
  };

  // Map abbreviations to widgets
  final Map<String, Widget> typeWidgets = {
    'cen': const ChoixEntree(),
    'cex': const ChoixExcellence(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: principale_color,
        title: const Center(
          child: Text(
            "Concours SN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ajout de la section À PROPOS
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const InfoDevPage()), // Navigate to InfoDevPage
                );
              },
              child: Column(
                children: const [
                  Icon(Icons.info, size: 40, color: principale_color),
                  SizedBox(height: 10),
                  Text(
                    "À PROPOS",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: principale_color,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
                height:
                    50), // Espacement entre la section À PROPOS et les boutons
            // Liste des concours
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: allType.keys.map((school) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    width: 360,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: principale_color,
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                      ),
                      onPressed: () {
                        String abbreviation = allType[school]!;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => typeWidgets[abbreviation]!,
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          school,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
