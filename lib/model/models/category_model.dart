// To parse this JSON data, do
//
//     final quizCategory = quizCategoryFromJson(jsonString);

import 'dart:convert';

QuizCategory quizCategoryFromJson(String str) => QuizCategory.fromJson(json.decode(str));

String quizCategoryToJson(QuizCategory data) => json.encode(data.toJson());

class QuizCategory {
  final List<String>? quizCategory;

  QuizCategory({
    this.quizCategory,
  });

  factory QuizCategory.fromJson(Map<String, dynamic> json) => QuizCategory(
    quizCategory: json["category"] == null ? [] : List<String>.from(json["category"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "categorry": quizCategory == null ? [] : List<dynamic>.from(quizCategory!.map((x) => x)),
  };
}
