import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;

  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Text(
        question.title,
        style: AppTextStyles.heading,
      ),
      SizedBox(
        height: 24,
      ),
      ...question.answers
          .map(
            (e) => AnswerWidget(isRight: e.isRight, title: e.title),
          )
          .toList(),
    ]));
  }
}
