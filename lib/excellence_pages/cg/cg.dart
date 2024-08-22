import 'package:Concours_SN/main_pages/constantes.dart';
import 'package:flutter/material.dart';

class Home_CG extends StatefulWidget {
  const Home_CG({super.key});

  @override
  State<Home_CG> createState() => _Home_CGState();
}

class _Home_CGState extends State<Home_CG> {
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
            "ÉPREUVES CG",
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
