import 'package:flutter/material.dart';
import 'package:mark/constants/colors.dart';
import 'package:mark/constants/mark_images.dart';
import 'package:mark/screens/student_modal.dart';
import 'package:mark/data/students_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cpf = '';

  void updateCpf(String newCpf) {
    setState(() {
      cpf = newCpf;
    });
  }

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
                      children: [SearchBar()],
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

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _textEditingController;
  String cpf = '';

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onSearchPressed() {
    String enteredCPF = _textEditingController.text.trim();

    if (enteredCPF.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return StudentModal(
            cpf: enteredCPF,
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                const Text(
                  'CPF Inválido',
                  style:
                      TextStyle(color: redTitle, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 200),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(MarkImages.close),
                ),
              ],
            ),
            content:
                const Text('Por favor, insira um número de matrícula válido.'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: BorderStyle.solid,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
            child: Center(
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Digite a matricula',
                  contentPadding: EdgeInsets.only(left: 24.0),
                ),
                maxLines: 1,
                onSubmitted: (_) {
                  _onSearchPressed();
                },
              ),
            ),
          ),
          SizedBox(
            width: 208,
            height: 70,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryGreen),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                _onSearchPressed();
              },
              child: const Text('Consultar estudante'),
            ),
          ),
        ],
      ),
    );
  }
}
