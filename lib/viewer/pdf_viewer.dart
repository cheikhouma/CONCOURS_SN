import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:permission_handler/permission_handler.dart'; // Import pour les permissions

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

  Future<void> _requestPermissionAndDownload() async {
    // Vérification du statut de la permission
    var status = await Permission.storage.status;

    if (status.isGranted) {
      // Téléchargez le fichier si la permission est déjà accordée
      await _downloadFile();
    } else if (status.isDenied ||
        status.isRestricted ||
        status.isLimited ||
        status.isPermanentlyDenied) {
      // Demander la permission à l'utilisateur
      bool? permissionGranted = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Permission nécessaire'),
          content: Text(
              'Cette application a besoin de la permission de stockage pour télécharger le fichier.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Refuser la permission
              },
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true); // Accepter la permission
              },
              child: Text('Autoriser'),
            ),
          ],
        ),
      );

      if (permissionGranted == true) {
        status = await Permission.storage.request();

        if (status.isGranted) {
          await _downloadFile(); // Téléchargez le fichier si la permission est accordée
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Permission de stockage refusée')),
          );
        }
      }
    }
  }

  Future<void> _downloadFile() async {
    try {
      // Obtenir le chemin du répertoire de téléchargement
      final directory = await getExternalStorageDirectory();
      final downloadDirectory = Directory('${directory!.path}/Concours SN');

      // Créer le répertoire s'il n'existe pas encore
      if (!await downloadDirectory.exists()) {
        await downloadDirectory.create(recursive: true);
      }

      // Déterminer le chemin complet du fichier
      final filePath =
          '${downloadDirectory.path}/${widget.pdfFileName.split('/').last}';

      // Lire le fichier à partir des assets
      final byteData = await rootBundle.load(widget.pdfFileName);
      final file = File(filePath);

      // Écrire les données dans un fichier
      await file.writeAsBytes(byteData.buffer.asUint8List());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fichier téléchargé à $filePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors du téléchargement du fichier: $e')),
      );
    }
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
      floatingActionButton: FloatingActionButton(
        onPressed: _requestPermissionAndDownload, // Appeler la nouvelle méthode
        backgroundColor: principale_color,
        child: const Icon(Icons.download, color: white),
      ),
    );
  }
}
