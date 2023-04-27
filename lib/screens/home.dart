import 'package:flutter/material.dart';
import 'package:mark/constants/colors.dart';
import 'package:mark/constants/mark_images.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 960,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    MarkImages.logo,
                    fit: BoxFit.fitWidth,
                  ),
                  const Text(
                    'Insira a matrícula do estudante para visualizar o\nrisco de abandono acadêmico.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: subtitleColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 16,
              child: Image.asset(
                MarkImages.footer,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
