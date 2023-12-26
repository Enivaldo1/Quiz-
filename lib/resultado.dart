import 'package:flutter/material.dart';
import 'quiz..dart';

class Argumentos{
  int acertos = 0;

  Argumentos(this.acertos);
}


class Resultado extends StatelessWidget {
  const Resultado({super.key});

  static const routeName = 'Resultado';

  @override
  Widget build(BuildContext context) {

    final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Resultado')),

        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Resultado',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold  ),),
              Center(
                child: 
                Text(
                  'Você acertou\n${argumentos.acertos} de 10\nperguntas',
                  style: TextStyle(fontSize: 20, ),),),
        
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'Quiz');
                  },
                 child: Text('Jogar Novamente', style: TextStyle(fontSize: 30),),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      ),
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
