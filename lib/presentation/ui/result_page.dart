import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/presentation/ui/component/gradient_container.dart';
import 'package:quiz_app/presentation/ui/component/result_card.dart';
import 'package:quiz_app/presentation/cubit/trivia_cubit.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: BlocBuilder<QuestionCubit, QuestionState>(
          bloc: context.read<QuestionCubit>(),
          builder: (context, state) {
            if (state is QuestionLoaded) {
              return SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You Answered ${state.questions.where((e) => e.userAnswer == e.answerKey).length}  out of ${state.questions.length} questions corectly!",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 300,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...state.questions.mapIndexed((index, e) =>
                                  ResultCard(question: e, number: index + 1))
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton.icon(
                        onPressed: () {
                          context.go("/quiz");
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Restart Quiz!",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
