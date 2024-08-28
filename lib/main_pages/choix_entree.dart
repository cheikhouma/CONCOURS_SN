import 'package:Concours_SN/viewer/entree_viewer.dart';
import 'package:flutter/material.dart';
import 'package:Concours_SN/main_pages/constantes.dart';

class ChoixEntree extends StatefulWidget {
  const ChoixEntree({super.key});

  @override
  State<ChoixEntree> createState() => _ChoixEntreeState();
}

class _ChoixEntreeState extends State<ChoixEntree> {
  Map<String, String> allSchools = {
    'École Militaire de Santé': 'EMS',
    'École Nationale Supérieure de l\'Agronomie': 'ENSA',
    'École Polytechnique de Thiés': 'EPT',
    'École Supérieure Polytechnique': 'ESP',
    'Institut Polytechnique de Saint Louis': 'IPSL',
    'Polytech Diamniadio': 'PD'
  };

  // Map abbreviations to widgets
  final Map<String, List> schoolDates = {
    'EMS': [
      '2013',
      '2014',
      '2015',
      '2016',
    ],
    'ENSA': [
      "2011",
      "2012",
      "2013",
      "2014",
      "2015",
      "2018",
      "2019",
      "2021",
      "2022",
      "2023",
    ],
    'EPT': [
      "2007",
      "2008",
      "2010",
      "2011",
      "2012",
      "2013",
      "2014",
      "2016",
      "2017",
      "2018",
      "2019",
      "2020",
      "2021"
    ],
    'ESP': [],
    'PD': [],
    'IPSL': []
  };
  final Map<String, String> schoolFIleName = {
    'EMS': 'ems',
    'ENSA': 'ensa',
    'EPT': 'ept',
    'ESP': 'esp',
    'PD': 'pd',
    'IPSL': 'ipsl'
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
        child: SingleChildScrollView(
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
                          builder: (context) => EntreeViewer(
                            allDates: schoolDates[abbreviation]!,
                            school: abbreviation,
                            pdffilename:
                                "assets/epreuves/entree/${schoolFIleName[abbreviation]}/$abbreviation",
                          ),
                        ),
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
      ),
    );
  }
}
