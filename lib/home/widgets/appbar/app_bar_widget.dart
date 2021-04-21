import 'package:dev_quiz/core/core.dart';
import '../../../home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
                height: 250,
                child: Stack(
                  children: [
                    Container(
                      height: 161,
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(gradient: AppGradients.linear),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(
                              text: "Olá, ",
                              style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                    text: "Gabriel",
                                    style: AppTextStyles.titleBold),
                              ])),
                          Container(
                            width: 58,
                            height: 58,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://scontent.fcpq2-1.fna.fbcdn.net/v/t1.6435-9/174335526_5271268376277551_465455251165677190_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeFp5WccPX8ElAP0KGQ6sz-tmt-QXtPnufea35Be0-e59x0LzIO3IyLMtEJQTdyZ6b5d4NEH1g_XwWH5Yk-Mj8X8&_nc_ohc=TcmaRlkPkDEAX8TFGUm&_nc_ht=scontent.fcpq2-1.fna&oh=512af7c6d18936f2fb0b6848ff0551e7&oe=60A4D1FD"))),
                          )
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment(0.0, 1.0),
                        child: ScoreCardWidget())
                  ],
                )));
}
