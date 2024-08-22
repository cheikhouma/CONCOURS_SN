import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';
import 'package:Concours_SN/main_pages/pdf_viewer.dart';

class Home_EPT extends StatefulWidget {
  const Home_EPT({super.key});

  @override
  State<Home_EPT> createState() => _Home_EPTState();
}

class _Home_EPTState extends State<Home_EPT> {
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
      appBar: AppBar(
        backgroundColor: principale_color,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: white), // Change color to black
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: const Center(
          child: Text(
            "ÉPREUVES EPT",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // General padding around the grid
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 600, // Adjust as needed to limit the grid width
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items per row
                mainAxisSpacing: 30.0, // Spacing between rows
                crossAxisSpacing: 30.0, // Spacing between columns
                childAspectRatio: 2, // Aspect ratio of the cards
              ),
              itemCount: allDates.length,
              shrinkWrap: true, // Allow GridView to wrap its content
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
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
                          pageBuilder: (context, animation,
                                  secondaryAnimation) =>
                              PdfViewPage(
                                  pdfFileName:
                                      "assets/epreuves/entree/ept/$date.pdf"),
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
                          color: black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
