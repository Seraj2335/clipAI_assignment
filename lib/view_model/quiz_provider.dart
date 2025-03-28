import 'package:clipwise_ai_assignment/model/models/category_model.dart';
import 'package:clipwise_ai_assignment/model/models/groq_response_model.dart';
import 'package:clipwise_ai_assignment/model/models/quiz_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/apis/api_reponse.dart';
import '../model/respositories/response_repositories.dart';

class QuizProvider with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  ApiResponse _apiResponse1 = ApiResponse.initial("Empty data");
  String? category;
  List<List<bool?>> _selectedOptions = [];

  List<List<bool?>> get selectedOptions => _selectedOptions;

  ApiResponse get response => _apiResponse;

  ApiResponse get response1 => _apiResponse1;

  void fetchQuizList(String category) async {
    _apiResponse = ApiResponse.initial('loading');
    try {
      List<QuizList> quizList = await QuizRepository().fetchQuizList(category);
      _selectedOptions = quizList
          .map((quiz) => List<bool?>.filled(quiz.options!.length, null))
          .toList();
      _apiResponse = ApiResponse.completed(quizList);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Failed to fetch news details: $e');
      notifyListeners(); // Notify listeners of the error
      rethrow;
    }
  }

  void fetchQuizCategory(String category) async {
    _apiResponse1 = ApiResponse.initial('loading');
    try {
      List<String> quizCategory =
          await QuizRepository().fetchQuizCategory(category);

      _apiResponse1 = ApiResponse.completed(quizCategory);
      notifyListeners();
    } catch (e) {
      _apiResponse1 = ApiResponse.error('Failed to fetch news details: $e');
      notifyListeners();
    }
  }

  void setCategory(String value) {
    category = value;
  }

  String? get categoryData => category;

  void checkAnswer(int questionIndex, int optionIndex, bool isCorrect) {
    _selectedOptions[questionIndex][optionIndex] = isCorrect;
    notifyListeners();
  }

  void resetOptions(int questionIndex) {
    _selectedOptions[questionIndex] =
        List.generate(_selectedOptions[questionIndex].length, (index) => null);
    notifyListeners();
  }
}
