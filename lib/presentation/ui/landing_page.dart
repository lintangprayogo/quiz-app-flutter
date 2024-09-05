import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/ui/component/gradient_container.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        colorTop: Colors.white,
        colorBotom: const Color.fromARGB(255, 142, 42, 196),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/quiz-logo.png", width: 300),
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Challenge your knowledge !!!",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                context.go("/quiz");
              },
              label: const Text("Start Quiz"),
              icon: const Icon(Icons.arrow_right_alt),
            )
          ],
        ));
  }
}
