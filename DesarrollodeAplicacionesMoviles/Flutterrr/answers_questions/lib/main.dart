import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   var questionIndex = 0;

//   void answerQuestion() {
//     print('Answer 2');
//     questionIndex++;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var questions = [
//       'What\'s your favorite color?',
//       'What\'s your favorite animal?'
//     ];
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My First App'),
//         ),
//         body: Column(children: [
//           Text(questions[questionIndex]),
//           ElevatedButton(
//               onPressed: () => print('Answer 1'), child: Text('Answer 1')),
//           ElevatedButton(onPressed: answerQuestion, child: Text('Answer 2')),
//         ]),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var nPressed = 0;

  void _answerQuestion() {
    setState(() {
      questionIndex++;
      questionIndex %= 2;
    });
  }

  void countClick() {
    setState(() {
      nPressed++;
    });
    print(nPressed);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(children: [
          //Text(questions[questionIndex]),
          Question(nPressed.toString()),
          ElevatedButton(onPressed: countClick, child: Text('Count Click')),
          Question(questions[questionIndex]),
          ElevatedButton(
              onPressed: _answerQuestion, child: Text('Change question')),
        ]),
      ),
    );
  }
}
