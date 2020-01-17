import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', false),
  ];

  String getQuestionText() => _questions[_questionNumber].questionText;

  bool getRightAnswer() => _questions[_questionNumber].questionAnswer;

  void nextQuestion() => _questionNumber++;

  bool isFinished() => (_questionNumber >= _questions.length - 1);

  bool shouldReset() => (_questionNumber >= _questions.length);

  int getIndex() => _questionNumber;

  int getQLength() => _questions.length;

  void reset() => _questionNumber = 0;
}
