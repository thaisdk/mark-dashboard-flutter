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
            child: SizedBox(
              width: 960,
              height: 298,
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
                  const SizedBox(height: 38),
                  Container(
                    width: 960,
                    height: 118,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 705,
                          height: 70,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: InputBorderColor,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                              )),
                          child: const Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Digite a matricula',
                                contentPadding: EdgeInsets.only(left: 24.0),
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 208,
                          height: 70,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(primaryGreen),
                                  shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                  )))),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        height: 640.0,
                                        width: 560.0,
                                        child: Column(children: [
                                          Row(children: [
                                            SizedBox(
                                              width: 528,
                                              height: 75,
                                              child: Text('John Doe'),
                                            ),
                                          ])
                                        ]),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text('Consultar estudante')),
                        ),
                      ],
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
            child: SizedBox(
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
