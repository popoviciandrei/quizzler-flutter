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

  void nextQuestion() {
    //if (!isLastQuestion()) {
    _questionNumber++;
    //}
  }

  bool isLastQuestion() => (_questionNumber == _questions.length - 1);
  bool noMoreQuestions() => (_questionNumber == _questions.length);

  void debug() {
    print('Counter: $_questionNumber, No if Questions: ${_questions.length} ');
  }

  void reset() => _questionNumber = 0;
}
