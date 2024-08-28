import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:Concours_SN/main_pages/pdf_viewer.dart';
import 'package:flutter/material.dart';

class SubjectsViewer extends StatefulWidget {
  final String subject;
  final List allDates;
  final String pdfFileName;
  final String level;
  final String classe;

  const SubjectsViewer(
      {super.key,
      required this.subject,
      required this.allDates,
      required this.pdfFileName,
      required this.level,
      required this.classe});

  @override
  State<SubjectsViewer> createState() => _SubjectsViewerState();
}

class _SubjectsViewerState extends State<SubjectsViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: principale_color,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            '${widget.subject} ${widget.level}',
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items per row
                mainAxisSpacing: 30.0, // Spacing between rows
                crossAxisSpacing: 30.0, // Spacing between columns
                childAspectRatio: 2, // Aspect ratio of the cards
              ),
              itemCount: widget.allDates.length,
              shrinkWrap: true, // Allow GridView to wrap its content
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling
              itemBuilder: (context, index) {
                String date = widget.allDates[index];
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
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  PdfViewPage(
                                      pdfFileName:
                                          "${widget.pdfFileName}_$date.pdf"),
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
