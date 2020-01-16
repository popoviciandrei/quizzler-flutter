import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questions = [
    Question(
      q: 'You can lead a cow down stairs but not up stairs.',
      a: false,
    ),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(
      q: 'A slug\'s blood is green.',
      a: false,
    ),
  ];

  String getQuestionText() => _questions[_questionNumber].questionText;
  bool getRightAnswer() => _questions[_questionNumber].questionAnswer;

  void nextQuestion() {
    if (!isLastQuestion()) {
      _questionNumber++;
    }
  }

  bool isLastQuestion() => (_questionNumber >= _questions.length - 1);

  void reset() => _questionNumber = 0;
}
