import 'package:Concours_SN/viewer/subjects_viewer.dart';
import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';

class Home_JP_Terminale extends StatefulWidget {
  const Home_JP_Terminale({super.key});

  @override
  State<Home_JP_Terminale> createState() => _Home_JP_TerminaleState();
}

class _Home_JP_TerminaleState extends State<Home_JP_Terminale> {
  Map<String, String> allSubjects = {
    'Mathématiques': 'maths',
    'Physique': 'physique',
    'Cons Méca': 'cons_meca'
  };

  // Map abbreviations to widgets
  final Map<String, List?> subjectsDates = {
    'maths': ['2018', '2019', '2021', '2024'],
    'physique': ["2024"],
    'cons_meca': ["2015", "2018", "2019", '2024'],
  };

  final Map<String, String> fileName = {
    'maths': "Maths",
    'physique': 'Physique',
    'cons_meca': 'ConsMeca'
  };

  final String level = 'terminale';
  final String classe = 'Terminale';

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
        title: Center(
          child: Text(
            "JP $classe",
            style: const TextStyle(
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
          children: allSubjects.keys.map((subject) {
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
                    String abbreviation = allSubjects[subject]!;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubjectsViewer(
                          subject: subject,
                          allDates: subjectsDates[abbreviation]!,
                          pdfFileName:
                              "assets/epreuves/excellence/junior_polytech/$level/$abbreviation/JP_${fileName[abbreviation]}_Tle",
                          level: level,
                          classe: classe,
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      subject,
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
