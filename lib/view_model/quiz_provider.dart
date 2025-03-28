import 'package:clipwise_ai_assignment/model/models/groq_response_model.dart';
import 'package:clipwise_ai_assignment/model/models/quiz_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/apis/api_reponse.dart';
import '../model/respositories/response_repositories.dart';

class QuizProvider with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  List<List<bool?>> _selectedOptions = [];

  List<List<bool?>> get selectedOptions => _selectedOptions;

  ApiResponse get response => _apiResponse;

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
