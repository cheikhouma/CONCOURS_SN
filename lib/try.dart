import 'package:Concours_SN/main_pages/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:Concours_SN/main_pages/constantes.dart';

class Home_JP_Math extends StatefulWidget {
  const Home_JP_Math({super.key});

  @override
  State<Home_JP_Math> createState() => _Home_JP_MathState();
}

class _Home_JP_MathState extends State<Home_JP_Math> {
  int _selectedIndex = 0; // State variable to track selected tab
  String _pdfFileName =
      "assets/epreuves/excellence/junior_polytech/premiere/cons_meca/2024/Ep2024.pdf"; // Default PDF

  // List of PDF file paths
  final List<String> _pdfFilePaths = [
    "assets/epreuves/excellence/junior_polytech/premiere/cons_meca/2024/Ep2024.pdf",
    "assets/epreuves/excellence/junior_polytech/premiere/cons_meca/2024/Co2024.pdf",
  ];

  void _onBottomNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pdfFileName = _pdfFilePaths[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            PdfViewPage(pdfFileName: _pdfFileName), // Display the selected PDF
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavBarTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Épreuves',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Correction',
          ),
        ],
        backgroundColor: Colors.grey[400],
        selectedItemColor: principale_color,
        unselectedItemColor: white,
      ),
    );
  }
}
