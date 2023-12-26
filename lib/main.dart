import 'package:flutter/material.dart';
import 'package:quiz/resultado.dart';
import 'homepage.dart'; // Aqui importa a class Homepage
import 'quiz..dart'; // importa a class quiz


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => Homepage(),
        'Quiz':(context) => Quiz(),
        'Resultado':(context) => Resultado()
      },
    );
  }
}
