import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';

class Home_IPSL extends StatefulWidget {
  const Home_IPSL({super.key});

  @override
  State<Home_IPSL> createState() => _Home_IPSLState();
}

class _Home_IPSLState extends State<Home_IPSL> {
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
            "ÉPREUVES IPSL",
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
