import 'package:flutter/material.dart';
import 'package:quiz/quiz..dart';

class Homepage extends StatelessWidget {

  
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',
            width: 500,
            height: 420,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('pressionado');
                  
                  Navigator.pushNamed(context, 'Quiz');
                },
                child: Image.asset('assets/images/start.png',
                fit: BoxFit.cover,
                width: 500,
                height: 100,),
                style: ElevatedButton.styleFrom(// dando stilo e usando espaçamentos
                  padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  
                ),),
            )
          ],
        ),
      ),
      ),
    );
  }
}