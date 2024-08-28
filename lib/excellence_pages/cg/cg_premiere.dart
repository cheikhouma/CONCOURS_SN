import 'package:Concours_SN/viewer/subjects_viewer.dart';
import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';

class Home_CG_Premiere extends StatefulWidget {
  const Home_CG_Premiere({super.key});

  @override
  State<Home_CG_Premiere> createState() => _Home_CG_PremiereState();
}

class _Home_CG_PremiereState extends State<Home_CG_Premiere> {
  Map<String, String> allSubjects = {
    'Allemand': 'allemand',
    'Anglais': 'anglais',
    'Arabe': 'arabe',
    'Citoyenneté': 'citoyennete',
    'Espagnol': 'espagnol',
    'Français': 'francais',
    'Géographie': 'geographie',
    'Grec': 'grec',
    'Histoire': 'histoire',
    'Italien': 'italien',
    'Latin': 'latin',
    'Mathématiques': 'maths',
    'Physique': 'physique',
    'Portugais': 'portugais'
  };

  // Map abbreviations to widgets
  final Map<String, List?> subjectsDates = {
    'allemand': ['2006', '2015', '2017'],
    'anglais': ['2004', '2006', '2015', '2017'],
    'arabe': ['2015', '2017'],
    'citoyennete': ['2004', '2005', '2006', '2015', '2017'],
    'espagnol': ['2004', '2005', '2006', '2015', '2017'],
    'francais': ['2004', '2005', '2006', '2015', '2017'],
    'geographie': ['2004', '2005', '2006', '2015', '2017'],
    'grec': ['2017'],
    'histoire': ['2004', '2005', '2006', '2015', '2017'],
    'italien': ['2004', '2005', '2006', '2015', '2017'],
    'latin': ['2004', '2005', '2006', '2017'],
    'maths': ['2004', '2005', '2006', '2015', '2017'],
    'physique': ['2018', '2019', '2020', '2021', '2022', '2023'],
    'portugais': ['2015', '2017'],
  };

  final Map<String, String> fileName = {
    'allemand': 'allemand',
    'anglais': 'anglais',
    'arabe': 'arabe',
    'citoyennete': 'citoyen',
    'espagnol': 'espagnol',
    'francais': 'francais',
    'geographie': 'geo',
    'grec': 'grec',
    'histoire': 'hist',
    'italien': 'italien',
    'latin': 'latin',
    'maths': 'maths',
    'physique': 'phys',
    'portugais': 'portugais',
  };

  final String level = 'premiere';
  final String classe = 'Première';

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
            "CG $classe",
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
        child: SingleChildScrollView(
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
                                "assets/epreuves/excellence/concours_general/$level/$abbreviation/cgs1_${fileName[abbreviation]}",
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
      ),
    );
  }
}
