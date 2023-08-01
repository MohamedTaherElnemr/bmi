import 'dart:math';

import 'package:bmi/pages/result_page.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({
    super.key,
  });

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  bool isMale = true;

  double sliderValue = 120.0;
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        isMale = true;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: isMale ? Colors.blue : Colors.grey.shade400,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/male2.png'),
                              height: 90.0,
                              width: 90.0,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        isMale = false;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: isMale ? Colors.grey.shade400 : Colors.blue,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/femaleicon.png'),
                              height: 90.0,
                              width: 90.0,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${sliderValue.round()}',
                        style: const TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'CM',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                  Slider(
                    value: sliderValue,
                    max: 220.0,
                    min: 80.0,
                    onChanged: (value) {
                      sliderValue = value;
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade400,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          Text(
                            '${age}',
                            style: const TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'age-',
                                onPressed: () {
                                  age--;
                                  setState(() {});
                                },
                                child: Icon(Icons.remove),
                                mini: true,
                              ),
                              FloatingActionButton(
                                heroTag: 'age+',
                                onPressed: () {
                                  age++;
                                  setState(() {});
                                },
                                child: Icon(Icons.add),
                                mini: true,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade400,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          Text(
                            '${weight}',
                            style: const TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'w-',
                                onPressed: () {
                                  weight--;
                                  setState(() {});
                                },
                                child: Icon(Icons.remove),
                                mini: true,
                              ),
                              FloatingActionButton(
                                heroTag: 'w+',
                                onPressed: () {
                                  weight++;
                                  setState(() {});
                                },
                                child: Icon(Icons.add),
                                mini: true,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: MaterialButton(
              height: 50.0,
              onPressed: () {
                double result = weight / pow(sliderValue / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        isMale: isMale,
                        age: age,
                        result: result.round(),
                      );
                    },
                  ),
                );
              },
              color: Colors.lightGreen,
              child: const Text(
                'CALCULATE',
                style: TextStyle(fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
