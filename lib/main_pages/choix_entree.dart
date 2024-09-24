import 'package:Concours_SN/viewer/entree_viewer.dart';
import 'package:flutter/material.dart';
import 'package:Concours_SN/main_pages/constantes.dart';

class ChoixEntree extends StatefulWidget {
  const ChoixEntree({super.key});

  @override
  State<ChoixEntree> createState() => _ChoixEntreeState();
}

class _ChoixEntreeState extends State<ChoixEntree> {
  List<SchoolInfo> schools = [
    SchoolInfo(
      name: 'École Militaire de Santé',
      abbreviation: 'EMS',
      dates: [
        "2013",
        "2014",
        "2015",
        "2016",
      ],
      fileName: 'ems',
    ),
    SchoolInfo(
      name: 'École Nationale Supérieure de l\'Agronomie',
      abbreviation: 'ENSA',
      dates: [
        "2011",
        "2012",
        "2013",
        "2014",
        "2015",
        "2018",
        "2019",
        "2021",
        "2022",
        "2023"
      ],
      fileName: 'ensa',
    ),
    SchoolInfo(
      name: 'École Polytechnique de Thiès',
      abbreviation: 'EPT',
      dates: [
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
      fileName: 'ept',
    ),
    SchoolInfo(
      name: 'École Supérieure Polytechnique',
      abbreviation: 'ESP',
      dates: ["2016", "2017", "2018"],
      fileName: 'esp',
    ),
    SchoolInfo(
      name: 'Institut Polytechnique de Saint Louis',
      abbreviation: 'IPSL',
      dates: ["2018", "2020", "2022"],
      fileName: 'ipsl',
    ),
    SchoolInfo(
        name: "Lycée d'Excellence de Diourel",
        abbreviation: "LSED",
        dates: [
          "2016",
          "2017",
          "2018",
          "2019",
          "2021",
          "2022",
        ],
        fileName: 'lsed')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
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
            children: schools.map((schoolInfo) {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EntreeViewer(
                            allDates: schoolInfo.dates,
                            school: schoolInfo.abbreviation,
                            pdffilename:
                                "assets/epreuves/entree/${schoolInfo.fileName}/${schoolInfo.abbreviation}",
                          ),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        schoolInfo.name,
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

class SchoolInfo {
  final String name;
  final String abbreviation;
  final List<String> dates;
  final String fileName;

  SchoolInfo({
    required this.name,
    required this.abbreviation,
    required this.dates,
    required this.fileName,
  });
}
