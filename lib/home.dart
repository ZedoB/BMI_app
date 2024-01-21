import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isMale = true;
  double height = 170;
  double weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(child: Text('BMI',style: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold
        ),),),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  m1(context, 'male'),
                  const SizedBox(width: 15,),
                  m1(context, 'female'),
                ],
              ),
            )
          ),
          const SizedBox(height: 16,),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Height',style: TextStyle(
                    color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toStringAsFixed(2),style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                      const Text('cm',style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold
                      )),
                    ],
                  ),
                  Slider(min: 90, max: 220, thumbColor: Colors.white,
                      value: height, onChanged: (val){
                    setState(() {
                      height = val;
                    });
                  })
                ],
              ),
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  m2(context, 'weight'),
                  const SizedBox(width: 15,),
                  m2(context, 'age'),
                ],
              ),
            )
          ),
          const SizedBox(height: 16,),
          Container(
            color: Colors.teal,
            width: double.infinity,
            height: MediaQuery.of(context).size.height/16,
            child: TextButton(onPressed: (){
              double result = weight / (pow(height/100, 2));
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => Result(result: result, isMale: isMale, age: age)));
            }, child: const Text('Calculate',style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold
            )),),
          )
        ],
      ),
    );
  }

  Expanded m1(BuildContext context, String type) {
    return Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  isMale  = type == 'male' ? true : false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (isMale && type == 'male') || (!isMale && type == 'female') ?
                  Colors .teal : Colors.blueGrey
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(type == 'male' ? Icons.male : Icons.female,
                    color: Colors.white,size: 60,),
                    const SizedBox(height: 20,),
                    Text(type == 'male' ? 'Male' : 'Female')
                  ],
                ),
              ),
            )
          );
  }

  Expanded m2(BuildContext context, String type) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(type == 'age' ? 'Age' : 'Weight'),
              Text(type == 'age' ? '$age' : '$weight'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        type == 'age' ? age++ : weight++;
                      });
                    }, mini: true,
                    heroTag: type == 'age' ? 'age++' : 'weight++',
                    child: const Icon(Icons.add),),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        type == 'age' ? age-- : weight--;
                      });
                    }, mini: true,
                    heroTag: type == 'age' ? 'age--' : 'weight--',
                    child: const Icon(Icons.remove),)
                ],
              )
            ],
          ),
        )
    );
  }
}
