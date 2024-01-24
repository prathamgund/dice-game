import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
    int leftDiceNumber = 1;
    int rightDiceNumber = 1;
    
    String message = 'Player 1, your Turn';

    void whoWins() {
     if (leftDiceNumber > rightDiceNumber) {
      message = 'Player 1 Wins! 🏁';
    } else if (rightDiceNumber > leftDiceNumber) {
      message = 'Player 2 Wins! 🏁';
    } else {
      message = 'It\'s a Tie!';
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dice'),
          backgroundColor: Colors.red,
          centerTitle: true,
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                      child: Image.asset('images/dice$leftDiceNumber.png'),
                      onPressed: () {
                        setState(() {
                          leftDiceNumber = Random().nextInt(6) + 1 ;
                          message = 'Player 2, your turn.';
                        });
                      },
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                      child: Image.asset('images/dice$rightDiceNumber.png'),
                      onPressed: () {
                         setState(() {
                          rightDiceNumber = Random().nextInt(6) + 1 ;
                          whoWins();
                      },);
                      },
                      ),
                    ),
                  ],
                ),
                 const SizedBox(
                  height: 30.0,
                ),
                Text(
                   message,
                   textAlign: TextAlign.center,
                   style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
                   ),
            ],
          ),
        ),
      ),
    );
  }
}