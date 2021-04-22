import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/home_state.dart';

import '../home/widgets/quiz_card/quiz_card_widget.dart';
import '../home/widgets/level_button/level_button_widget.dart';
import '../home/widgets/appbar/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
          appBar: AppBarWidget(user: controller.user!),
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(
                      label: "Fácil",
                    ),
                    LevelButtonWidget(
                      label: "Médio",
                    ),
                    LevelButtonWidget(
                      label: "Difícil",
                    ),
                    LevelButtonWidget(
                      label: "Perito",
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.count(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                      children: controller.quizzes!
                          .map((e) => QuizCardWidget(
                              title: e.title,
                              percent: e.questionAnswered / e.questions.length,
                              completed:
                                  "${e.questionAnswered}/${e.questions.length}"))
                          .toList()),
                )
              ],
            ),
          ));
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        )),
      );
    }
  }
}
