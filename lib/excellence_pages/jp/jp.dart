import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';

class Home_JP extends StatefulWidget {
  const Home_JP({super.key});

  @override
  State<Home_JP> createState() => _Home_JPState();
}

class _Home_JPState extends State<Home_JP> {
  Map<String, String> allLevel = {
    'Première': 'pre',
    'Terminale': 'ter',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: principale_color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: white), // Change color to black
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: const Center(
          child: Text(
            "ÉPREUVES JP",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
