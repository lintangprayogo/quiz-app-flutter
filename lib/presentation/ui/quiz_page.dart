import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/ui/component/gradient_container.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/presentation/ui/component/option_button.dart';
import 'package:quiz_app/presentation/cubit/trivia_cubit.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:collection/collection.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int position = 0;

  @override
  void initState() {
    super.initState();
    context.read<QuestionCubit>().getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        child: Container(
      height: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Center(
        child: BlocBuilder<QuestionCubit, QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoaded) {
              return SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "QUESTION ${position + 1}",
                      style: const TextStyle(fontSize: 50, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.white60),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          HtmlUnescape()
                              .convert(state.questions[position].question),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...state.questions[position]
                        .getShufledOptions()
                        .mapIndexed((index, option) => OptionButton(
                            index: index,
                            option: option,
                            onTap: () {
                              context
                                  .read<QuestionCubit>()
                                  .answerQuestion(option, position);
                              setState(() {
                                if (position < state.questions.length - 1) {
                                  position++;
                                } else {
                                  context.go("/results");
                                }
                              });
                            }))
                  ],
                ),
              );
            } else if (state is QuestionError) {
              return Center(
                  child: Text(
                state.error,
                style: const TextStyle(fontSize: 24),
              ));
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }
          },
        ),
      ),
    ));
  }
}
