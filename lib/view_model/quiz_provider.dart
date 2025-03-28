import 'package:clipwise_ai_assignment/model/models/groq_response_model.dart';
import 'package:clipwise_ai_assignment/model/models/quiz_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/apis/api_reponse.dart';
import '../model/respositories/response_repositories.dart';

class QuizProvider with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response => _apiResponse;

  void fetchQuizList(String category) async {
    try {
      _apiResponse = ApiResponse.initial('loading');
      List<QuizList> quizList =
          await QuizRepository().fetchQuizList(category);

      _apiResponse = ApiResponse.completed(quizList);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Failed to fetch news details: $e');
      notifyListeners(); // Notify listeners of the error
      rethrow;
    }
  }
}
