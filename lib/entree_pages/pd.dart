// ignore_for_file: camel_case_types

import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';

class Home_PD extends StatefulWidget {
  const Home_PD({super.key});

  @override
  State<Home_PD> createState() => _Home_PDState();
}

class _Home_PDState extends State<Home_PD> {
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
            "ÉPREUVES PD",
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