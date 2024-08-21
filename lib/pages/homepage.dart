// IGNORE_FOR_FILE: PREFER_CONST_CONSTRUCTORS

import 'package:CONCOURS_SN/pages/constantes.dart';
import 'package:flutter/material.dart';
import 'package:CONCOURS_SN/pages/infosdev.dart';
import 'package:CONCOURS_SN/pages/pdf_viewer.dart';

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
            icon: const Icon(Icons.info),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InfosDev()),
              )
            },
            color: Colors.white,
            iconSize: 30,
          ),
        ],
        title: const Center(
          child: Text(
            "ÉPREUVES CONCOURS EPT",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(127, 23, 52, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items per row
            mainAxisSpacing: 20.0, // Spacing between rows
            crossAxisSpacing: 20.0, // Spacing between columns
            childAspectRatio: 3 / 2, // Aspect ratio of the cards
          ),
          itemCount: allDates.length,
          itemBuilder: (context, index) {
            String date = allDates[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          PdfViewPage(pdfFileName: "assets/epreuves/$date.pdf"),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    date,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(127, 23, 52, 1),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
