import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/questionsController.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(FlutterQuiz());

QuestionController _questionController = QuestionController();

class FlutterQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 5,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "images/quiz.jpg",
            ),
          ),
          title: Text(
            "Quiz Time",
            style: GoogleFonts.lato(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          brightness: Brightness.dark,
        ),
        body: FlexibleBody(),
      ),
    );
  }
}

class FlexibleBody extends StatefulWidget {
  @override
  _FlexibleBodyState createState() => _FlexibleBodyState();
}

class _FlexibleBodyState extends State<FlexibleBody> {
  void checkAnswer(String userAnswer) {
    setState(
      () {
        if (_questionController.qnFinished()) {
          Alert(
              title: "Quiz Result",
              context: context,
              desc: "No of questions you have corrected is :" +
                  _questionController.getCorrect(),
              buttons: [
                DialogButton(
                  child: Text("Ok !"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ]).show();
          _questionController.resetCounter();
        } else {
          if (_questionController.getAnswer() == userAnswer) {
            _questionController.increaseCorrect();
          } else {
            _questionController.increaseIncorrect();
          }
          _questionController.nextQuestion();
        }
      },
    );
  }

  Widget countAnswer({@required String text, @required Color color}) {
    return Card(
      child: Container(
        width: 160,
        height: 50,
        color: color,
        margin: EdgeInsets.all(3),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "font1"),
          ),
        ),
      ),
    );
  }

  Widget dividerPadding() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        thickness: 4,
        color: Colors.black12,
      ),
    );
  }

  Widget noQuestion({@required String text}) {
    return Card(
      child: Container(
        width: 50,
        height: 30,
        color: Colors.white,
        margin: EdgeInsets.all(3),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "font1"),
          ),
        ),
      ),
    );
  }

  Widget images({@required Image image}) {
    return Card(
      child: Container(
        width: 300,
        height: 150,
        color: Colors.blue,
        child: image,
        margin: EdgeInsets.all(5),
      ),
    );
  }

  Widget questionText({@required String text}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "font1"),
    );
  }

  Widget buttons({@required String text}) {
    return FlatButton(
      child: Card(
        child: Container(
          width: 150,
          height: 50,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: "font1",
                  fontSize: 18,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      onPressed: () {
        checkAnswer(text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              countAnswer(
                  text: "No. of correct ans \n" +
                      _questionController.getCorrect(),
                  color: Colors.green),
              countAnswer(
                  text: "No. of incorrect ans \n" +
                      _questionController.getIncorrect(),
                  color: Colors.orange),
            ],
          ),
          dividerPadding(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              noQuestion(text: "Qn." + _questionController.getNum()),
              noQuestion(text: "Ttl." + _questionController.getTtlLen()),
            ],
          ),
          images(
            image: Image.asset(
              _questionController.getImage(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          questionText(text: _questionController.getQuestions()),
          dividerPadding(),
          Row(
            children: <Widget>[
              buttons(text: _questionController.btnTxt1()),
              buttons(text: _questionController.btnTxt2()),
            ],
          ),
          Row(
            children: <Widget>[
              buttons(text: _questionController.btnTxt3()),
              buttons(text: _questionController.btnTxt4()),
            ],
          ),
        ],
      ),
    );
  }
}
