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
  bool hasRequestedPermission = false;

  @override
  void initState() {
    super.initState();
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
    // Extraire la date du nom de fichier PDF
    RegExp regex = RegExp(r'.*_(.*)\.pdf$');
    RegExpMatch? match = regex.firstMatch(widget.pdfFileName);
    String date =
        match?.group(1) ?? 'Inconnu'; // Gérer la valeur null en toute sécurité

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: white),
          onPressed: () {
            Navigator.pop(context); // Naviguer vers la page précédente
          },
        ),
        title: Text(
          'Épreuve $date',
          style: const TextStyle(
              fontFamily: "Poppins", fontWeight: FontWeight.w500, color: white),
        ),
        backgroundColor: principale_color,
      ),
      body: PdfView(
        controller: _pdfController,
        pageSnapping: false,
        scrollDirection: Axis.vertical,
        backgroundDecoration: const BoxDecoration(color: white),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: white,
      ),
    );
  }
}
