import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// membuat object quizBrain
QuizBrain quizBrain = QuizBrain();

// main Method
void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 219, 92, 1),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(195, 255, 147, 1),
          title: Text(
            'Quiz Tentang Sejarah Indonesia',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // array/list untuk menyimpan score, berupa Icon check or close.
  List<Icon> scoreKeeper = [];

  // menghitung jawaban benar dan salah
  int numCorrect = 0;
  int numIncorrect = 0;

  // fungsi mengecek jawaban dari user (parameter userPickedAnswer)
  // ke jawaban dari daftar pertanyaan (list questions/_questionBanks)
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    // setState
    setState(() {
      //TODO: Step 4 - menggunakan IF/ELSE untuk cek akhir quiz
      //jika ia, maka ke line berikuntya
      if (quizBrain.isFinished() == true ) {
        //TODO Step 4 Part A - menampilkan alert menggunakan rFlutter_alert
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You\'ve reached the end of the Quiz\n'
          'Correct Answers: $numCorrect\n'
          'Incorrect Answers: $numIncorrect\n'
          'Total Questions: ${quizBrain.getTotalQuestions()}',
        ).show();

        quizBrain.reset();

        scoreKeeper = [];
      }

      //TODO: Step 6 - if not reached the end, ELSE do the answer checking
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.red,
          ));
          numCorrect++;
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.black,
          ));
          numIncorrect++;
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  )
              ),
            ),
          ),
        ),
       Expanded(
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextButton(
      onPressed: () {
        checkAnswer(true);
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(const Color.fromRGBO(255, 175, 97, 1)),
        foregroundColor: MaterialStatePropertyAll(Colors.black),
        textStyle: MaterialStatePropertyAll(
          TextStyle(fontSize: 20.0),
        ),
      ),
      child: const Text(
        "TRUE",
      ),
    ),
  ),
),
       Expanded(
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextButton(
      onPressed: () {
        checkAnswer(false);
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(const Color.fromRGBO(255, 112, 171, 1)),
        foregroundColor: MaterialStatePropertyAll(Colors.black),
        textStyle: MaterialStatePropertyAll(
          TextStyle(fontSize: 20.0),
        ),
      ),
      child: const Text(
        "FALSE",
      ),
    ),
  ),
),

        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}