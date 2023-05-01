import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mark/screens/home.dart';

void main() async {
  runApp(const MarkApp());
}

class MarkApp extends StatelessWidget {
  const MarkApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mark',
      home: HomePage(),
    );
  }
}
