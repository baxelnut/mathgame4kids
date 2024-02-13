import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mathgametutorial/const.dart';
import 'package:mathgametutorial/util/my_button.dart';
import 'package:mathgametutorial/util/result_message.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

String variable = '+';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // number pad list
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '-',
    '0',
    '.'
  ];

  // number A, number B
  int numberA = 1;
  int numberB = 1;
  int waddup = 1;

  // user answer
  String userAnswer = '';

  // user tapped a button
  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        if (waddup == 1) {
          checkResultPlus();
        } else if (waddup == 2) {
          checkResultMinus();
        } else if (waddup == 3) {
          checkResultTimes();
        } else if (waddup == 4) {
          checkResultDivide();
        }
      } else if (button == 'C') {
        // clear input
        userAnswer = '';
      } else if (button == 'DEL') {
        // delete the last number
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 5) {
        // maximum of 5 numbers can be inputted
        userAnswer += button;
      }
    });
  }

  // check if user is correct or not

  void checkResultPlus() {
    if (numberA + numberB == double.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Sorry try again',
              onTap: goBackToQuestion,
              icon: Icons.rotate_left,
            );
          });
    }
  }

  void checkResultMinus() {
    if (numberA - numberB == double.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Sorry try again',
              onTap: goBackToQuestion,
              icon: Icons.rotate_left,
            );
          });
    }
  }

  void checkResultTimes() {
    if (numberA * numberB == double.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Sorry try again',
              onTap: goBackToQuestion,
              icon: Icons.rotate_left,
            );
          });
    }
  }

  void checkResultDivide() {
    // print(userAnswer);
    // print(numberA ~/ numberB);
    // print(double.parse((numberA / numberB).toStringAsFixed(2)));
    if (numberA ~/ numberB == double.parse(userAnswer) > 0 ||
        double.parse((numberA / numberB).toStringAsFixed(2)) ==
            double.parse(userAnswer)) {
      // print('object');
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    } else {
      // print('objectaaa');
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Sorry try again',
              onTap: goBackToQuestion,
              icon: Icons.rotate_left,
            );
          });
    }
  }

  // create random numbers
  var randomNumber = Random();

  // GO TO NEXT QUESTION
  void goToNextQuestion() {
    // dismiss alert dialog
    Navigator.of(context).pop();

    // reset values
    setState(() {
      userAnswer = '';
    });

    // create a new question
    numberA = randomNumber.nextInt(100);
    numberB = randomNumber.nextInt(100);

    // Future<void> musiks = AssetsAudioPlayer.newPlayer().open(
    //   Audio('assets/audio/congratulations.mp3'),
    //   // loopMode: LoopMode.single
    // );
  }

  // GO BACK TO QUESTION
  void goBackToQuestion() {
    // dismiss alert dialog
    Navigator.of(context).pop();
    // reset values
    setState(() {
      userAnswer = '';
    });

    // Future<void> musiks = AssetsAudioPlayer.newPlayer().open(
    //   Audio('assets/audio/rizz.mp3'),
    //   // loopMode: LoopMode.single
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 40, //change size on your need
          color: Colors.white,
          //change color on your need
        ),

        backgroundColor: Colors.pink,
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.menu,
        //       color: Colors.amber,
        //       size: 50,
        //     ),
        //     onPressed: () {},
        //   )
        // ],
        title: Padding(
          padding: const EdgeInsets.only(left: 235),
          child: Text(
            'click there →',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.pink[300],
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink, fixedSize: Size(75, 75)),
              onPressed: () {
                waddup = 1;
                variable = '+';

                Navigator.pop(context);
                setState(() {});
              },
              child: Text(
                '+',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              )),
          Container(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink, fixedSize: Size(75, 75)),
              onPressed: () {
                waddup = 2;
                variable = '-';

                Navigator.pop(context);
                setState(() {});
              },
              child: Text(
                '-',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              )),
          Container(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink, fixedSize: Size(75, 75)),
              onPressed: () {
                waddup = 3;
                variable = '×';

                Navigator.pop(context);
                setState(() {});
              },
              child: Text(
                '×',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              )),
          Container(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink, fixedSize: Size(75, 75)),
              onPressed: () {
                waddup = 4;
                variable = '÷';

                Navigator.pop(context);
                setState(() {});
              },
              child: Text(
                '÷',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              )),
        ]),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.pink,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "Math Game for Cristy\n",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "created by",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    color: Colors.black,
                    child: GradientText(
                      '~ABONKI THE GOAT~',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      colors: const [
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                        Colors.green,
                        Colors.blue,
                        Colors.purple,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // question
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // question
                  Text(
                    '$numberA $variable $numberB = ',
                    style: whiteTextStyle,
                  ),

                  // answer box
                  Container(
                    height: 60,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        userAnswer,
                        style: whiteTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // number pad
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
