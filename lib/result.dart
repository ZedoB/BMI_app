import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.result, required this.isMale, required this.age});

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase{
    String resultText = '';
    if(result >= 30) {resultText = 'Obese';}
    else if(result >= 25 && result < 30) resultText = 'Overweight';
    else if(result >= 18.5 && result < 25) resultText = 'Normal';
    else resultText = 'Thin';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Result'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(isMale ? 'Male' : 'Female',style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold
              ),),
              Text('Result : $resultPhrase',style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold
              ),),
              Text('Healthiness : ${result.toStringAsFixed(2)}',style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold
              ),),
              Text('Age : $age',style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
