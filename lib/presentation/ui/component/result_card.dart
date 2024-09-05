import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quiz_app/domain/question_domain.dart';

class ResultCard extends StatelessWidget {
  final int number;
  final QuestionDomain question;

  const ResultCard({super.key, required this.number, required this.question});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: question.answerKey == question.userAnswer
                  ? Colors.green
                  : const Color.fromARGB(153, 244, 67, 54),
              shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Text(
            "$number",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                HtmlUnescape().convert(question.question),
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                HtmlUnescape().convert(question.userAnswer),
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              Text(
                HtmlUnescape().convert(question.answerKey),
                style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
