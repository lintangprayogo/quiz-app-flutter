import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/data/question_service.dart';
import 'package:quiz_app/domain/usecase/get_question.dart';
import 'package:quiz_app/presentation/cubit/trivia_cubit.dart';
import 'package:quiz_app/presentation/ui/landing_page.dart';
import 'package:quiz_app/presentation/ui/quiz_page.dart';
import 'package:quiz_app/presentation/ui/result_page.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: "/quiz",
        builder: (context, state) => const QuizPage(),
      ),
      GoRoute(
          path: "/results",
          builder: (context, state) {
            return const ResultPage();
          }),
    ]);

    return BlocProvider(
      create: (context) =>
          QuestionCubit(GetQuestions(triviaRepository: QuestionService(Dio()))),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
