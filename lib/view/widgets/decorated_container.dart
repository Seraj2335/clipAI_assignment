import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view_model/quiz_provider.dart';

class DecoratedContainer extends StatelessWidget {
  final String text;
  final Color? secondColor;
  final Alignment? alignment;
  final int? indexO;
  final int? indexQ;
  final String? answer;
  final QuizProvider? provider;

  const DecoratedContainer({
    super.key,
    this.indexO,
    this.indexQ,
    this.provider,
    this.answer,
    required this.text,
    this.secondColor,
    this.alignment,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (provider != null) {
          provider!.checkAnswer(indexQ!, indexO!, text == answer!);
        }
      },
      child: Container(
          alignment: alignment,
          margin: EdgeInsets.only(bottom: size.height * .02),
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .05, vertical: size.width * .03),
          decoration: BoxDecoration(
              color: Color(0xff212426),
              gradient: LinearGradient(colors: [
                Color(0xff000000),
                secondColor ?? Color(0x00000000)
              ]),
              border: Border.all(
                  color: getColor(provider?.selectedOptions[indexQ!][indexO!]),
                  width: .5),
              boxShadow: [
                BoxShadow(
                    offset: Offset(2, 1),
                    blurRadius: 1,
                    spreadRadius: 0,
                    color: Color(0x28000000)),
                BoxShadow(
                    offset: Offset(-2, -3),
                    blurRadius: 2,
                    spreadRadius: 0,
                    color: Color(0x0AFFFFFF))
              ],
              borderRadius: BorderRadius.all(
                  Radius.circular(secondColor != null ? 10 : 25))),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Color getColor(value) {
    if (value == null) {
      return Color(0x05000000);
    } else if (value == false) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}