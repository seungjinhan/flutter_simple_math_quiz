import 'question.dart';

class QuestionList {
  final List<Question> _questionList;
  int _currentQuestionIndex = -1;

  QuestionList(this._questionList) {
    _questionList.shuffle();
  }

  int get length => _questionList.length;
  int get questionNumber => _currentQuestionIndex + 1;

  Question get nextQuestion {
    _currentQuestionIndex++;
    if (_currentQuestionIndex > length) {
      return null;
    }
    return _questionList[_currentQuestionIndex];
  }
}
