import 'package:Concours_SN/main_pages/choix_entree.dart';
import 'package:Concours_SN/main_pages/choix_excellence.dart';
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: allType.keys.map((school) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                width: 400,
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
                          builder: (context) => typeWidgets[abbreviation]!),
                    );
                  },
                  child: Center(
                    child: Text(
                      school,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
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
