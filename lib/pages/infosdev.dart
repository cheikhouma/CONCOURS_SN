// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InfosDev extends StatefulWidget {
  const InfosDev({super.key});

  @override
  State<InfosDev> createState() => _InfosDevState();
}

class _InfosDevState extends State<InfosDev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
        backgroundColor: Color.fromRGBO(194, 132, 40, 1),
      ),
      body: Center(
        child: Column(children: [
          RichText(
            text: TextSpan(
                text:
                    "Cette application est developpee par Cheikh Oumar Diallo",
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0), fontSize: 30)),
          ),
          Icon(
            Icons.copyright,
            size: 80,
            color: Color.fromRGBO(194, 132, 40, 1),
          )
        ]),
      ),
    );
  }
}
