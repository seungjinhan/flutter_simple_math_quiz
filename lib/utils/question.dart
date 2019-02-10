class Question {
  final String _choiceA;
  final String _choiceB;
  final String _choiceC;
  final String _choiceD;
  final String _questionTitle;
  final String _correctChoice;

  Question(this._questionTitle, this._choiceA, this._choiceB, this._choiceC, this._choiceD, this._correctChoice);

  String get choiceA => _choiceA;
  String get choiceB => _choiceB;
  String get choiceC => _choiceC;
  String get choiceD => _choiceD;
  String get questionTitle => _questionTitle;
  String get correctChoice => _correctChoice;
}
