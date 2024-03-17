import 'package:bmi/HomePage.dart';
import 'package:flutter/material.dart';

class MyResult extends StatelessWidget {
  var result;
  var age;
  bool isMale;
  MyResult({required this.age, required this.isMale, required this.result});
  String get resultText {
    String RT = 'defulte';
    if (result < 18.0) {
      RT = 'Thin';
    }
    else if (result >= 18.0 && result < 25.0) {
      RT = 'Normal';
    }
    else if (result >= 25.0 && result < 30.0) {
      RT = 'Over Weight';
    }
    else if (result >= 30.0) {
      RT = 'Obese';
    }
    return RT;
  }

  Color get resultColor {
    Color c = Colors.white;
    if (result < 18) {
      c = Colors.lightBlueAccent;
    } else if (result >= 18 && result < 25) {
      c = Colors.green;
    } else if (result >= 25 && result < 30) {
      c = Colors.orange;
    } else if (result >= 30) {
      c = Colors.red;
    }
    return c;
  }

 String get resultMSG {
    String m='defulte' ;
    if (result < 18) {
      m = 'You suffer from thinness, you need to pay attention to your diet';
    } else if (result >= 18 && result < 25) {
      m = "You're at a normal weight, keep it up";
    } else if (result >= 25 && result < 30) {
      m = 'You have some extra weight, you should pay attention';
    } else if (result >= 30) {
      m = 'You are obese, you should consult a doctor';
    }
    return m;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Age: $age ',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      "Gender: ${isMale ? 'Male' : 'Female'}",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                Text(
                  'Your Result',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        resultText,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: resultColor),
                      ),
                      Text(
                        '${result.toStringAsFixed(1)}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Container(
                        padding:EdgeInsets.all(10),
                        alignment:Alignment.center,
                        child: Text(
                          '$resultMSG',
                          style: Theme.of(context).textTheme.headline3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => MyHomePage(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: double.infinity,
                    color: Colors.teal,
                    child: Text(
                      'Try Again',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
