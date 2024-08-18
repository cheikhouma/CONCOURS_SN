// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ept/pages/infosdev.dart';
import 'package:ept/pages/pdf_viewer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> allDates = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfosDev()),
              )
            },
            color: Colors.black,
            iconSize: 30,
          ),
        ],
        title: Center(
          child: Text(
            "ÉPREUVES CONCOURS EPT",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 27,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(221, 153, 57, 1),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 20),
        children: allDates.map(
          (date) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  color: Color.fromRGBO(221, 153, 57, 1),
                  fontSize: 25,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              onPressed: () {
                // Navigate to the PDF viewer page with the selected PDF file
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PdfViewPage(pdfFileName: "assets/epreuves/$date.pdf"),
                  ),
                );
              },
              child: Text(
                date,
                style: TextStyle(
                  color: Color.fromRGBO(221, 153, 57, 1),
                  fontSize: 25,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
