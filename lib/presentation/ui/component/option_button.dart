import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class OptionButton extends StatelessWidget {
  final String option;
  final int index;
  final VoidCallback onTap;

  const OptionButton(
      {super.key,
      required this.index,
      required this.option,
      required this.onTap});

  String optionLabel() {
    if (index == 0) {
      return "A";
    } else if (index == 1) {
      return "B";
    } else if (index == 2) {
      return "C";
    } else {
      return "D";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text(
                  optionLabel(),
                  style: const TextStyle(color: Colors.white70 ,fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: Text(HtmlUnescape().convert(option),
                 style: const TextStyle(fontWeight: FontWeight.bold,color:Colors.deepPurpleAccent),
                ),
              ),
            ],
          ),
        ));
  }
}
