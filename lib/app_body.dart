import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

class CulturalQuiz extends StatefulWidget {
  const CulturalQuiz({super.key});

  @override
  State<CulturalQuiz> createState() => _CulturalQuizState();
}

class _CulturalQuizState extends State<CulturalQuiz> {
  List<Widget> answerResult = [];

  int rightAnswers = 0;

  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = appBrain.getQuestionAnswer();
    setState(() {
      if (whatUserPicked == correctAnswer) {
        rightAnswers++;
        answerResult.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerResult.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      if (appBrain.isFinished) {
        _congratDialog();
      } else {
        appBrain.nextQuestion();
      }
    });
  }

  Future<void> _congratDialog() async {
    await Alert(
      context: context,
      title: "Congratulations! You've completed the Cultural Quiz",
      desc: "You scored $rightAnswers out of 10 Questions.Great job exploring different cultures and testing your knowledge." +
          "Feel free to retake the quiz to improve your score or share your cultural expertise with others!",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
          child: const Text(
            "Done",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
    appBrain.reset();
    setState(() {
      answerResult.clear();
      rightAnswers = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0), 
                child: Image.asset(
                  appBrain.getQuestionImage(),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                appBrain.getQuestionText(),
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                side: const BorderSide(width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 233, 52, 52),
                side: const BorderSide(width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
