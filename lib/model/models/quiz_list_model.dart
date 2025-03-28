// To parse this JSON data, do
//
//     final quizList = quizListFromJson(jsonString);

import 'dart:convert';

List<QuizList> quizListFromJson(String str) => List<QuizList>.from(json.decode(str).map((x) => QuizList.fromJson(x)));

String quizListToJson(List<QuizList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizList {
  final String? question;
  final List<String>? options;
  final String? answer;

  QuizList({
    this.question,
    this.options,
    this.answer,
  });

  factory QuizList.fromJson(Map<String, dynamic> json) => QuizList(
    question: json["question"],
    options: json["options"] == null ? [] : List<String>.from(json["options"]!.map((x) => x)),
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
    "answer": answer,
  };
}
