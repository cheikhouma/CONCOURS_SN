// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:Concours_SN/main_pages/constantes.dart';

class InfoDevPage extends StatelessWidget {
  const InfoDevPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: principale_color,
        title: const Text(
          "À propos du développeur",
          style: TextStyle(color: white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/dev_photo.jpg'),
              ),
              const Text(
                "Cheikh Oumar DIALLO",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: principale_color,
                ),
              ),
              const Text(
                "Élève ingenieur à l'EPT en GIT",
                style: TextStyle(
                  fontSize: 20,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(color: secondary_color),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: secondary_color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Cette application a été développée avec passion pour répondre à un besoin réel: la difficulté d'accéder aux épreuves de concours au Sénégal. En tant que jeune passionné par le développement, je souhaite apporter mon soutien à mes fréres et sœurs lycéens de tout le pays.\nJe remercie sincèrement toutes les personnes, de près ou de loin, qui ont contribué à ce projet, en particulier mon homonyme, mes camarades de promotion et mes anciens.\nMerci de l'utiliser, et n’hésitez pas à me contacter pour toute question ou suggestion. Vos retours sont précieux pour améliorer cette solution.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, color: black, fontFamily: 'Poppins'),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email, color: principale_color),
                title: const Text(
                  " Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: GestureDetector(
                  child: const Text(
                    " dcheikhoumar@ept.sn",
                    style: TextStyle(color: principale_color, fontSize: 16),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: principale_color),
                title: const Text(
                  " Téléphone",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: const Text(
                  " +221 77 418 94 39",
                  style: TextStyle(color: principale_color, fontSize: 16),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/github.png",
                  width: 30,
                  height: 30,
                ),
                title: const Text(
                  "Github",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "https://github.com/cheikhouma",
                  style: TextStyle(
                    fontSize: 16,
                    color: principale_color,
                  ),
                ),
              ),
              const Text(
                "Concours_SN: Parce que l'Excellence se mérite",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
