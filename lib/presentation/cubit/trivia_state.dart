part of 'trivia_cubit.dart';

sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class QuestionLoaded extends QuestionState {
  final List<QuestionDomain> questions;
  QuestionLoaded({required this.questions});
}

final class QuestionError extends QuestionState {
  final String error;
  QuestionError({required this.error});
}
