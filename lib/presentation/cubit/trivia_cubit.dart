import 'package:bloc/bloc.dart';
import 'package:quiz_app/domain/question_domain.dart';
import 'package:quiz_app/domain/usecase/get_question.dart';

part 'trivia_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final GetQuestions _getQuestion;

  QuestionCubit(this._getQuestion) : super(QuestionInitial());

  getQuestions() async {
    try {
      emit(QuestionInitial());
      final questions = await _getQuestion.excute();
      emit(QuestionLoaded(questions: questions));
    } catch (e) {
      emit(QuestionError(error: e.toString()));
    }
  }

  answerQuestion(String answer, int position) {
    if (state is QuestionLoaded) {
      (state as QuestionLoaded).questions[position].userAnswer = answer;
    }
  }
}
