import 'package:Concours_SN/excellence_pages/subjects_viewer.dart';
import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';

class Home_CG_Terminale extends StatefulWidget {
  const Home_CG_Terminale({super.key});

  @override
  State<Home_CG_Terminale> createState() => _Home_CG_TerminaleState();
}

class _Home_CG_TerminaleState extends State<Home_CG_Terminale> {
  Map<String, String> allSubjects = {
    'Citoyenneté': 'citoyennete',
    'Comptabilité': 'comptabilite',
    'Economie': 'economie',
    'Electronique': 'electronique',
    'Géographie': 'geographie',
    'Histoire': 'histoire',
    'Islamiques': 'islamiques',
    'Mathématiques': 'maths',
    'Philosophie': 'philo',
    'Physique': 'physique',
  };

  // Map abbreviations to widgets
  final Map<String, List?> subjectsDates = {
    'citoyennete': ['2004', '2005', '2006', '2015'],
    'comptabilite': ['2004', '2005', '2006', '2015', '2017'],
    'economie': ['2004', '2005', '2006', '2015', '2017'],
    'electronique': ['2015', '2017'],
    'geographie': ['2004', '2005', '2006', '2015', '2017'],
    'histoire': ['2004', '2005', '2006', '2015', '2017'],
    'islamiques': ['2017'],
    'maths': ['2004', '2005', '2006', '2015', '2017'],
    'philo': ['2004', '2005', '2006', '2015', '2017'],
    'physique': [
      '2004',
      '2005',
      '2006',
      '2007',
      '2008',
      '2009',
      '2010',
      '2013',
      '2014',
      '2015',
      '2016',
      '2017',
      '2018',
      '2019',
      '2020',
      '2021',
      '2022',
      '2023',
    ],
  };

  final Map<String, String> fileName = {
    'citoyennete': 'citoyen',
    'comptabilite': 'compt',
    'economie': 'eco',
    'electronique': 'elec',
    'geographie': 'geo',
    'histoire': 'hist',
    'islamiques': 'islamiques',
    'maths': 'maths',
    'philo': 'philo',
    'physique': 'phys'
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
                                "assets/epreuves/excellence/concours_general/$level/$abbreviation/cgs2_${fileName[abbreviation]}",
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
