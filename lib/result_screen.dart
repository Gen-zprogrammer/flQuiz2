// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fl_kuis/data/dummy.dart';
import 'package:fl_kuis/question_summary/question_summary.dart';

class SummaryAnswer {
  final int questionIndex;
  final String question;
  final String currectAnswer;
  final String userAnswer;
  SummaryAnswer({
    required this.questionIndex,
    required this.question,
    required this.currectAnswer,
    required this.userAnswer,
  });
}

class Result extends StatelessWidget {
  const Result(
      {super.key, required this.chosenAnswer, required this.onRestart});

  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<SummaryAnswer> get newSummaryData {
    final List<SummaryAnswer> summary = [];
    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        SummaryAnswer(
          questionIndex: i,
          question: questions[i].text,
          currectAnswer: questions[i].answers[0],
          userAnswer: chosenAnswer[i],
        ),
      );
    }

    return summary;
  }

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      //Perulangan
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          //jawaban benar di index ke0
          'correct_answer': questions[i].answers[0],
          //jawaban user
          'user_answer': chosenAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = newSummaryData
        .where((data) => data.userAnswer == data.currectAnswer)
        .length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Kamu menjawab $numCorrectQuestions dari $numTotalQuestions pertanyaan yang benar!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(child: QuestionsSummary(summaryData)),
          const SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            onPressed: onRestart,
            child: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }
}
