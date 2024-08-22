// ignore_for_file: prefer_const_constructors

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
    String date = widget.pdfFileName.replaceAll('.pdf', '');
    date = date.substring(date.lastIndexOf('/') + 1); // Get the year part

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: white), // Change color to black
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: Text(
          'Épreuve de l\'année $date',
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(127, 23, 52, 1),
      ),
      body: PdfView(
        controller: _pdfController,
        scrollDirection: Axis.vertical,
        backgroundDecoration: BoxDecoration(color: Colors.white),
      ),
    );
  }
}
