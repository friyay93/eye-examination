import 'package:eye_examination/dry%20eye/answer.dart';
import 'package:eye_examination/dry%20eye/result_dryeye.dart';
import 'package:flutter/material.dart';

class DryEyeQuestion extends StatefulWidget {
  static const routeName = '/resultDryEye';
  @override
  _DryEyeQuestionState createState() => _DryEyeQuestionState();
}

class _DryEyeQuestionState extends State<DryEyeQuestion> {
  int totalscore = 0;
  int _questionIndex = 0;
  int answerWasSelected = 0;
  int totalquestion = 0;

  void _questionAnswered(bool answerScore) {
    setState(() {
      answerWasSelected = 0;
      _nextQuestion();
      if (_questionIndex + 1 == _questions.length) {}
    });
  }

  void _nextQuestion() {
    if (_questionIndex + 1 != 12) {
      setState(() {
        _questionIndex++;
        answerWasSelected = 1;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultDryEye(
            totalScore: totalscore,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dry eye Quiz',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(height: 20.0),
            Container(
              width: double.infinity,
              height: 130.0,
              margin:
                  const EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.blueAccent)),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['question'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.7,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...(_questions[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map(
              (answer) => Answer(
                answerText: answer['answerText'] as String,
                answerTap: () {
                  _nextQuestion();
                  totalscore += answer['score'] as int;
                  print(totalscore);
                  if (answerWasSelected == 0) {
                    return;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _questions = [
  {
    'question':
        'คุณเคยมีประสบการณ์เหล่านี้ในสัปดาห์ทีผ่านมาหรือไม่\nตาสู้แสงไม่ได้',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
  {
    'question':
        'คุณเคยมีประสบการณ์เหล่านี้ในสัปดาห์ทีผ่านมาหรือไม่\nรู้สึกระคายเคืองตา',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
  {
    'question':
        'คุณเคยมีประสบการณ์เหล่านี้ในสัปดาห์ทีผ่านมาหรือไม่\nเจ็บตาปวดตา',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
  {
    'question': 'คุณเคยมีประสบการณ์เหล่านี้ในสัปดาห์ทีผ่านมาหรือไม่\nตาพร่ามัว',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
  {
    'question':
        'คุณเคยมีประสบการณ์เหล่านี้ในสัปดาห์ทีผ่านมาหรือไม่\nการมองเห็นแย่ลง',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
  {
    'question':
        'ตาของคุณมีปัญหาจนทำให้ทำกิจกรรมดังกล่าวได้น้อยลงในสัปดาห์ที่ผ่านมาหรือไม่\nการอ่านหนังสือ',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
  {
    'question':
        'ตาของคุณมีปัญหาจนทำให้ทำกิจกรรมดังกล่าวได้น้อยลงในสัปดาห์ที่ผ่านมาหรือไม่\nขับรถเวลากลางคืน',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
  {
    'question':
        'ตาของคุณมีปัญหาจนทำให้ทำกิจกรรมดังกล่าวได้น้อยลงในสัปดาห์ที่ผ่านมาหรือไม่\nทำงานกับคอมพิวเตอร์',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
  {
    'question':
        'ตาของคุณมีปัญหาจนทำให้ทำกิจกรรมดังกล่าวได้น้อยลงในสัปดาห์ที่ผ่านมาหรือไม่\nการดูทีวี',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
  {
    'question':
        'ตาของคุณมีปัญหาจนทำให้ทำกิจกรรมดังกล่าวได้น้อยลงในสัปดาห์ที่ผ่านมาหรือไม่\nภาวะลมแรง',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
  {
    'question':
        'ตาของคุณมีปัญหาจนทำให้ทำกิจกรรมดังกล่าวได้น้อยลงในสัปดาห์ที่ผ่านมาหรือไม่\nอยู่ในที่ๆมีอากาศแห้ง',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
  {
    'question':
        'ตาของคุณมีปัญหาจนทำให้ทำกิจกรรมดังกล่าวได้น้อยลงในสัปดาห์ที่ผ่านมาหรือไม่\nอยู่บริเวณที่มีเครื่องปรับอากาศ',
    'answers': [
      {'answerText': 'ไม่เคย', 'score': 1},
      {'answerText': 'มีอาการบางครั้ง', 'score': 2},
      {'answerText': 'ปานกลาง', 'score': 3},
      {'answerText': 'ส่วนใหญ่มีอาการ', 'score': 4},
      {'answerText': 'เป็นตลอดเวลา', 'score': 5},
    ],
  },
];
