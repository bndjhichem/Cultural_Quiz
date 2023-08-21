import 'question.dart';

class AppBrain {
  int questionNumber = 0;

  final List<Question> _questionGroup = [
    Question(
      i: 'images/image-1.jpg',
      q: 'Is the symbol in the picture a maple leaf ?',
      a: true,
    ),
    Question(
      i: 'images/image-2.jpg',
      q: 'The Great Wall of China is visible from space.',
      a: false,
    ),
    Question(
      i: 'images/image-3.jpg',
      q: 'The traditional Japanese art of folding paper is called origami.',
      a: true,
    ),
    Question(
      i: 'images/image-4.jpg',
      q: 'Sushi is a Korean dish made of fermented vegetables.',
      a: false,
    ),
    Question(
      i: 'images/image-5.jpg',
      q: 'The Taj Mahal is a mausoleum located in India.',
      a: true,
    ),
    Question(
      i: 'images/image-6.jpg',
      q: 'The Olympic Games originated in ancient Rome.',
      a: false,
    ),
    Question(
      i: 'images/image-7.jpg',
      q: 'Mount Everest is the tallest mountain in the world.',
      a: true,
    ),
    Question(
      i: 'images/image-8.jpg',
      q: 'The Hollywood Walk of Fame is located in Los Angeles, California.',
      a: true,
    ),
    Question(
      i: 'images/image-9.jpg',
      q: 'The famous landmark known as the Colosseum is located in Athens, Greece.',
      a: false,
    ),
    Question(
      i: 'images/image-10.jpg',
      q: 'The Great Pyramid of Giza is the only surviving Wonder of the Ancient World.',
      a: true,
    ),
  ];

  // Question question1 = Question(
  //   i: 'images/image-1.jpg',
  //   q: 'Is the symbol in the picture a maple leaf ?',
  //   a: true,
  // );

void nextQuestion() {
    if (questionNumber < _questionGroup.length - 1) {
      questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionGroup[questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[questionNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[questionNumber].questionAnswer;
  }

  bool get isFinished {
    return questionNumber >= _questionGroup.length - 1;
  }

  void reset() {
    questionNumber = 0;
  }
}
