import 'package:quiz/answerTwist.dart';
import 'package:quiz/questions.dart';

class QuestionController {
  int _num = 0;
  int _correct = 0;
  int _incorrect = 0;

  List<Questions> _question = [
    Questions(
        imageName: "images/flutter.png",
        questionText: "The above figure represents the symbol of ....",
        answerText: "Flutter"),
    Questions(
        imageName: "images/flutter.jpg",
        questionText: "When was flutter beta version introduced ?",
        answerText: "2017 May"),
    Questions(
        imageName: "images/flutter.jpg",
        questionText: "Who has developed flutter ?",
        answerText: "Google"),
    Questions(
        imageName: "images/flutter.jpg",
        questionText: "Which programming language is used by flutter ?",
        answerText: "Dart"),
    Questions(
        imageName: "images/dart.jpg",
        questionText: "The above figure represents the symbol of ....",
        answerText: "Dart")
  ];
  List<BtnTxt> _btnTxt = [
    BtnTxt(btn_1: "C++", btn_2: "Flutter", btn_3: "Java", btn_4: "Python"),
    BtnTxt(
        btn_1: "2016 May",
        btn_2: "2016 March",
        btn_3: "2017 May",
        btn_4: "2017 March"),
    BtnTxt(btn_1: "Firefox", btn_2: "Google", btn_3: "Mozila", btn_4: "Safari"),
    BtnTxt(btn_1: "C", btn_2: "Dart", btn_3: "Java", btn_4: "Php"),
    BtnTxt(btn_1: "C", btn_2: "Dart", btn_3: "Java", btn_4: "Php"),
  ];

  void increaseCorrect() {
    _correct++;
  }

  void increaseIncorrect() {
    _incorrect++;
  }

  void nextQuestion() {
    _num++;
  }

  bool qnFinished() {
    if (_num < _question.length - 1) {
      return false;
    } else {
      return true;
    }
  }

  void resetCounter() {
    _num = 0;
    _correct = 0;
    _incorrect = 0;
  }

  String getImage() {
    return _question[_num].imageName;
  }

  String getQuestions() {
    return _question[_num].questionText;
  }

  String getAnswer() {
    return _question[_num].answerText;
  }

  String btnTxt1() {
    return _btnTxt[_num].btn_1;
  }

  String btnTxt2() {
    return _btnTxt[_num].btn_2;
  }

  String btnTxt3() {
    return _btnTxt[_num].btn_3;
  }

  String btnTxt4() {
    return _btnTxt[_num].btn_4;
  }

  String getNum() {
    return _num.toString();
  }

  String getTtlLen() {
    int lengths = _question.length - 1;
    return lengths.toString();
  }

  String getCorrect() {
    return _correct.toString();
  }

  String getIncorrect() {
    return _incorrect.toString();
  }
}
