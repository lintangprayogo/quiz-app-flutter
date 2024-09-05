import 'package:quiz_app/domain/question_domain.dart';
import 'package:quiz_app/data/question_repository.dart';

class GetQuestions {
  final QuestionRepository _triviaRepository;

  GetQuestions({required QuestionRepository triviaRepository})
      : _triviaRepository = triviaRepository;

  Future<List<QuestionDomain>> excute() async {
    return await _triviaRepository.getQuestions();
  }
}
