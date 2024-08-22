import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';

class Home_ENSA extends StatefulWidget {
  const Home_ENSA({super.key});

  @override
  State<Home_ENSA> createState() => _Home_ENSAState();
}

class _Home_ENSAState extends State<Home_ENSA> {
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
            "ÉPREUVES ENSA",
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
