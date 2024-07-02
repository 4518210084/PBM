import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'VOC didirikan oleh Belanda pada tahun 1602 untuk memonopoli perdagangan rempah-rempah di Asia', questionAnswer: true),
    Question(questionText: 'Sistem tanam paksa (tanam paksa) diberlakukan oleh Belanda di Jawa pada abad ke-19', questionAnswer: true),
    Question(questionText: 'Perang Diponegoro adalah perlawanan rakyat Jawa terhadap Belanda yang dipimpin oleh Pangeran Diponegoro.', questionAnswer: true),
    Question(questionText: 'Sultan Agung Hanyakrakusuma adalah raja Mataram Islam yang terkenal dengan perlawanannya terhadap Portugis.', questionAnswer: false),
    Question(questionText: 'Pertempuran 5 Hari Semarang adalah pertempuran sengit antara rakyat Semarang dan pasukan Jepang pada tahun 1942.', questionAnswer: false),
    Question(questionText: 'Proklamasi kemerdekaan Indonesia dibacakan pada tanggal 17 Agustus 1945 oleh Soekarno dan Mohammad Hatta.', questionAnswer: true),
    Question(questionText: 'Belanda mengakui kemerdekaan Indonesia secara penuh pada tahun 1949 setelah Konferensi Meja Bundar.', questionAnswer: true),
    Question(questionText: 'Sutan Sjahrir adalah Perdana Menteri kedua Indonesia.', questionAnswer: false),
    Question(questionText: 'Pancasila adalah dasar negara Indonesia yang terdiri dari lima sila.', questionAnswer: true),
    Question(questionText: 'Bendera Merah Putih pertama kali dikibarkan pada peristiwa Sumpah Pemuda tahun 1928.', questionAnswer: true),
    Question(questionText: 'Indonesia pernah dijajah oleh Jepang selama 3,5 tahun.', questionAnswer:  true),
    Question(questionText: 'Pergerakan nasional Indonesia bertujuan untuk mencapai kemerdekaan dari penjajahan.', questionAnswer: true),
    Question(questionText: 'Pahlawan nasional Indonesia yang gugur dalam pertempuran melawan Belanda adalah Pangeran Diponegoro. ', questionAnswer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - create isFinished method that checks the last questions.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length -1  ) {
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Menghitung jumlah pertanyaan
  int getTotalQuestions() {
    return _questionBank.length - 1;
  }
  //TODO: Step 4 Part B - Create a reset() method that sets the questionNumber back to 0
  void reset() {
    _questionNumber = 0;
  }
}