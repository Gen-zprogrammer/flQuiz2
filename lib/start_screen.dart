import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            'Quiz Pemrograman Mobile!',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(150, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Color.fromARGB(150, 255, 255, 255),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Kerjakan Quiz', style: TextStyle(color: Color.fromARGB(150, 255, 255, 255),),),
          )
        ],
      ),
    );
  }
}