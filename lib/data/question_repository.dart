import 'package:quiz_app/domain/question_domain.dart';

abstract class QuestionRepository {
  Future<List<QuestionDomain>> getQuestions();
}
