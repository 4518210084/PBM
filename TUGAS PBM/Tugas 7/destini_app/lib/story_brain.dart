//TODO: Step 6 - import story.dart
import 'story.dart';

//TOTO: Step 5 - membuat class StoryBrain
class StoryBrain {
  //TODO: Step 7 - membuat storyData sebagai private properties
  final List<Story> _storyData = [
    Story(
        storyTitle:
        'Anda mengikuti pria bertopi lebar itu dan memasuki hutan. Dia mengaku sebagai penjaga hutan yang mengejar pemburu liar. Bersama, kalian mencari jalan keluar.',
        choice1: 'Bersahabat: Bangun kepercayaan dan rasakan persahabatan di tengah bahaya.',
        choice2: 'Curiga: Tetap waspada dan cari celah untuk melarikan diri.'),
    Story(
        storyTitle: 'Persahabatan Tak Terduga: Anda berhasil keluar dari hutan dan menjalin persahabatan unik dengan penjaga hutan. Pengalaman ini mengajarkan Anda untuk tidak mudah berprasangka buruk dan selalu mencari sisi positif dalam setiap situasi.',
        choice1: 'Memulai Cerita Kembali',
        choice2: ''),
    Story(
        storyTitle:
        'Anda mencari cara untuk melarikan diri, namun pria bertopi lebar itu selalu mengawasi. Ketegangan memuncak saat kalian bertemu dengan pemburu liar.',
        choice1: 'Membantu: Bersekutu untuk melawan pemburu liar dan menyelamatkan hutan.',
        choice2: 'Melarikan Diri: Mencari kesempatan untuk melarikan diri dan meninggalkan semuanya.'),
    Story(
        storyTitle:
        '"Anda adalah Seorang Pahlawah Hutan!!" Bersama penjaga hutan, Anda berhasil mengalahkan pemburu liar dan menyelamatkan hutan. Pengalaman ini mengubah hidup Anda dan menumbuhkan rasa cinta dan tanggung jawab terhadap alam.',
        choice1: 'Memulai Cerita Kembali',
        choice2: ''),
    Story(
        storyTitle:
        'Ketakutan Anda semakin kuat. Anda diam-diam mencari cara untuk melarikan diri, namun dia selalu mengawasi Anda. Ketegangan memuncak saat kalian bertemu dengan pemburu liar.',
        choice1: 'Melanjutkan Perjalanan',
        choice2: ''),
    Story(
        storyTitle:
        'Anda berhasil melarikan diri dari hutan, tapi rasa bersalah menghantui Anda. Anda tahu Anda harus kembali dan membantu penjaga hutan.',
        choice1: 'Mengulang Cerita Kembali',
        choice2: ''),
  ];

  //TODO: Step 8 - membuat method getStory() yang return first storyTitle dari _storyData.
  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  //TODO: Step 11 membuat method getChoice1 yang returnnya adalah choice1 dari _storyData
  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  //TODO: Step 12 membuat method getChoice1 yang returnnya adalah choice2 dari _storyData
  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  //TODO: Step 16 - Membuat property storyNumber yang dimulai dari nol (0).
  // Digunakan untuk tracking story yang sedang dilihat

  //TODO: Step 25 - ganti storyNumber property ke private property sehingga hanya
  // story_brain.dart yang bisa mengakses
  int _storyNumber = 0;

  void restart() {
    _storyNumber = 0;
  }

  //TODO: Step 17 - membuat method nextStory()
  void nextStory(int choiceNumber) {
    //TODO: Step 21 - menggunakan story plan, update nextStory ganti storyNumber
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 4) {
      _storyNumber = 2;
    } 

    //TODO: Step 22 - di nextStory() jika storyNumber 3 atau 4 atau 5,
    // artinya game berakhir dan panggil method restart()
    else if (_storyNumber == 1 || _storyNumber == 3 || _storyNumber == 5) {
      restart();
    }
  }

  //TODO: Step 27 - membuat method buttonShouldBeVisible() untuk mengecek apakah storyNumber is 0 or 1 or 2
  bool buttonShouldBeVisible() {
    //You could also just check if (_storyNumber < 3)
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    } 
  }
}