import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewPage extends StatefulWidget {
  final String pdfFileName;

  const PdfViewPage({super.key, required this.pdfFileName});

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  late PdfController _pdfController;

  @override
  void initState() {
    super.initState();
    // Initialize the PdfController with the PDF file passed from the HomePage
    _pdfController = PdfController(
      document: PdfDocument.openAsset(widget.pdfFileName),
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Extract the date from the PDF file name

    RegExp regex = RegExp(r'.*_(.*)\.pdf$');
    RegExpMatch? match = regex.firstMatch(widget.pdfFileName);
    String date = match!.group(1)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: white), // Change color to black
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: Text(
          'Épreuve de l\'année $date',
          style: const TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(127, 23, 52, 1),
      ),
      body: PdfView(
        controller: _pdfController,
        pageSnapping: false,
        scrollDirection: Axis.vertical,
        backgroundDecoration: const BoxDecoration(color: Colors.white),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: white,
      ),
    );
  }
}
