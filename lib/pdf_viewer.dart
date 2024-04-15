// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

// ignore: must_be_immutable
class PdfViewPage extends StatelessWidget {
  final String pdfFileName;

  const PdfViewPage({super.key, required this.pdfFileName});

  @override
  Widget build(BuildContext context) {
    // Extraire la date du nom de fichier PDF
    String date =
        pdfFileName.replaceAll('.pdf', ''); // Supprimer l'extension .pdf
    date = date.substring(date.lastIndexOf('/') +
        1); // Récupérer la partie du nom de fichier après le dernier '/'

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Epreuve de l\'année $date',
          style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color.fromRGBO(194, 132, 40, 1),
      ),
      body: PDFView(
        filePath: pdfFileName, // Chemin du fichier PDF à afficher
      ),
    );
  }
}
