import 'package:flutter/material.dart';

class EyeExam extends StatelessWidget {
  const EyeExam({Key? key}) : super(key: key);

  Widget _bodyWidget() {
    return const Center(
      child: Text('Eye Exam'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyWidget());
  }
}
