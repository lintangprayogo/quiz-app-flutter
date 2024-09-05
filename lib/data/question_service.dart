import 'package:dio/dio.dart';
import 'package:quiz_app/data/model/question.dart';
import 'package:quiz_app/domain/question_domain.dart';
import 'package:quiz_app/data/question_repository.dart';

class QuestionService extends QuestionRepository {
  final Dio dio;
  QuestionService(this.dio);

  @override
  Future<List<QuestionDomain>> getQuestions() async {
    final response = await dio.get(
        "https://opentdb.com/api.php?amount=15&category=9&difficulty=easy&type=multiple");

    final networkQuestions = (response.data["results"] as List<dynamic>)
        .map((results) => Question.fromResponse(results));

    final questions = networkQuestions
        .map((networkQuiz) => QuestionDomain(
            question: networkQuiz.question,
            options: [
              networkQuiz.correctAnswer,
              ...networkQuiz.incorrectAnswers
            ],
            answerKey: networkQuiz.correctAnswer))
        .take(10)
        .toList();

    questions.shuffle();
    return questions;
  }
}
