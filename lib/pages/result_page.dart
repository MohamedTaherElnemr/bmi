import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.isMale,
      required this.age,
      required this.result});

  final bool isMale;
  final int age;
  final int result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI RESULT',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Gender : ${isMale ? 'Male' : 'Female'}",
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              'Age : $age',
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              'Result : $result',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
