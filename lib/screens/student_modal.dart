import 'package:flutter/material.dart';
import 'package:mark/constants/colors.dart';
import 'package:mark/constants/mark_images.dart';

import '../data/students_data.dart';

class StudentModal extends StatelessWidget {
  final String cpf;

  const StudentModal({
    required this.cpf,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> studentData = students[cpf]!;
    String name = studentData['name'];
    bool isStableStudent = studentData['stable'];

    Widget situationWidget;
    double height;
    double width;

    if (isStableStudent) {
      situationWidget = const StableSituation();
      height = 255.0;
      width = 560.0;
    } else {
      situationWidget = const AlertSituation();
      height = 641.0;
      width = 560.0;
    }

    String formattedCpf =
        '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        height: height,
        width: width,
        child: Column(
          children: [
            StudentInfos(name: name, cpf: formattedCpf),
            situationWidget
          ],
        ),
      ),
    );
  }
}

class StudentInfos extends StatelessWidget {
  final String name;
  final String cpf;

  const StudentInfos({
    required this.name,
    required this.cpf,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 528,
      height: 75,
      margin: const EdgeInsets.only(left: 40.0, right: 32.0, top: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    name,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: titleColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  MarkImages.close,
                  width: 32,
                  height: 32,
                ),
              ),
            ],
          ),
          Text(
            cpf,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: grayColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class StableSituation extends StatelessWidget {
  const StableSituation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 496.0,
      height: 108.0,
      decoration: BoxDecoration(
        color: greenLabel,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          const BoxShadow(
            color: Color.fromRGBO(34, 135, 109, 0.25),
            offset: Offset(0, 2),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16.0, top: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          MarkImages.check,
                          width: 32,
                          height: 32,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Situação estável',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: greenTitle,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 56.0, top: 2),
                child: Text(
                  'De acordo com as características do estudante, as chances \ndesse estudante abandonar o curso são pequenas.',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: greenText,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AlertSituation extends StatelessWidget {
  const AlertSituation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 496.0,
          height: 108.0,
          decoration: BoxDecoration(
            color: redLabel,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              const BoxShadow(
                color: Color.fromRGBO(171, 82, 82, 0.25),
                offset: Offset(0, 2),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              MarkImages.alert,
                              width: 32,
                              height: 32,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Risco de abandono',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: redTitle,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 56.0, top: 2),
                    child: Text(
                      'De acordo com as características do estudante, as chances \ndesse estudante abandonar o curso são grandes.',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: redText,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 528,
          height: 50,
          margin: EdgeInsets.only(left: 40.0, top: 24.0),
          child: Column(
            children: [
              Row(
                children: [
                  AlertTab(),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 328,
          width: 528,
          margin: EdgeInsets.only(top: 24, left: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 496,
                    height: 252,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '1. MENTORIA',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: grayColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                                height: 4.0), // Espaçamento entre as linhas
                            Text(
                              'Um programa de mentoria pode ser uma ótima maneira de oferecer suporte e orientação aos alunos, especialmente para aqueles que podem estar lutando com a transição para a vida universitária.',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: titleColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2. ATIVIDADES EXTRACURRICULARES',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: grayColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Participar de atividades extracurriculares, como clubes e grupos de estudo, pode ajudar os alunos a desenvolver habilidades adicionais, criar conexões com outros estudantes e expandir seus interesses.',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: titleColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '3. ACESSO A RECURSOS UNIVERSITÁRIOS',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: grayColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Explorar os recursos oferecidos pela universidade, como bibliotecas, laboratórios e serviços de apoio acadêmico, pode enriquecer a experiência do aluno e auxiliar no seu desenvolvimento acadêmico.',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: titleColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AlertTab extends StatelessWidget {
  const AlertTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 43,
      // margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: redTitle,
            width: 1.0,
          ),
        ),
      ),
      child: Center(
        child: Text(
          'Ações sugeridas',
          style: TextStyle(
              color: redTitle, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}
