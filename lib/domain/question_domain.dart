class QuestionDomain {
  final String question;
  final List<String> options;
  final String answerKey;
  String userAnswer = "";

  QuestionDomain({
    required this.question,
    required this.options,
    required this.answerKey,
  });

  List<String> getShufledOptions() {
    final List<String> shuffledList = List.from(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
