import 'package:flutter/material.dart';
import 'package:quiz/main.dart';
import 'package:quiz/resultado.dart';
import 'homepage.dart';
import 'quizDados.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;

  @override
  Widget build(BuildContext context) {
    quiz.shuffle(); // Faz as perguntas da lista ser aleatorias


    quiz.forEach((elemento) { // Aqui faz as respostas embaralhar
      int alternativaCorreta =
          elemento['alternativa_correta']; // Corrigir o nome da chave
      List respostas = elemento['respostas']; // Corrigir o nome da chave

      String respostaCorreta = elemento['respostas']
          [alternativaCorreta - 1]; // Corrigir o nome da chave

      respostas.shuffle();

      //Aqui faz a 'alternativa_correta' mudar conforme muda as respostas se n da errado
      int i = 1;
      respostas.forEach((elemento) {
        if (elemento == respostaCorreta) {
          alternativaCorreta = i;
        }
        i++;
      });
      elemento['alternativa_correta'] = alternativaCorreta;
    });

    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
          print('acertou');
          acertos++;
        } else {
          print('errou');
          erros++;
        }

        print('Acertos totais: $acertos errors totais: $erros');

        if (perguntaNumero == 10) {
          print('Terminou o Quiz');
          Navigator.pushNamed(context, 'Resultado',
              arguments: Argumentos(acertos));
        } else {
          perguntaNumero++;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Perguntas e Respostas'),
          ),
        ),
        body: Padding(
          // usando a função padding pra dar um espaçamento em toda a tela
          padding: EdgeInsets.all(12.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                // função para alinhar
                alignment:
                    Alignment.topRight, //alinhando o text para o topo a direita
                child: Text(
                  'Pergunta $perguntaNumero de 10',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Pergunta:\n' + quiz[perguntaNumero - 1]['pergunta'],
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                // padronizando o tamanho do botão com SIZEDBOX já que fica de tamanhos diferentes
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Respondeu 1');
                    respondeu(1);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][0],
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    // dando stilo e usando espaçamentos
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('responseu 2');
                    respondeu(2);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][1],
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    // dando stilo e usando espaçamentos
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('respondeu 3');
                    respondeu(3);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][2],
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    // dando stilo e usando espaçamentos
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('respondeu 4');
                    respondeu(4);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][3],
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    // dando stilo e usando espaçamentos
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
