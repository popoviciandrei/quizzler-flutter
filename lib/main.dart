import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:quizzler/score_keeper.dart';

void main() => runApp(Quizzler());

QuizBrain quizBrain = new QuizBrain();
ScoreKeeper scoreKeeper = new ScoreKeeper();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void checkAnswer(bool userCheckedAnswer) {
    if (quizBrain.getQLength() > scoreKeeper.answers.length) {
      setState(() {
        var correctAnswer = quizBrain.getRightAnswer();

        if (correctAnswer == userCheckedAnswer) {
          scoreKeeper.goodAnswer();
        } else {
          scoreKeeper.badAnswer();
        }

        if (!quizBrain.isFinished()) {
          quizBrain.nextQuestion();
        }
      });
    }

    if (quizBrain.getQLength() == scoreKeeper.answers.length) {
      // generate dialog
      Widget dialog = AlertDialog(
        title: Text("Test finished"),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Results:'),
            ...scoreKeeper.answers,
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Reset'),
            onPressed: () {
              setState(() {
                scoreKeeper.reset();
                quizBrain.reset();
                Navigator.of(context).pop();
              });
            },
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );

      showDialog(
          context: context, builder: (_) => dialog, barrierDismissible: false);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(children: [
            Text(
              'Answers:',
              style: TextStyle(color: Colors.white),
            ),
            ...scoreKeeper.answers
          ]),
        )
      ],
    );
  }
}
