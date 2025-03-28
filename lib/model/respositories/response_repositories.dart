import 'dart:typed_data';

import 'package:clipwise_ai_assignment/model/models/quiz_list_model.dart';

import '../models/groq_response_model.dart';
import '../services/base_service.dart';
import '../services/quiz_service.dart';

class QuizRepository {
  final BaseService _quizService = QuizService();

  Future<dynamic> fetchQuizList(String value) async {
    final response = await _quizService.getResponse(value);
    String contentString =
        QuizResponse.fromJson(response).choices![0].message!.content!;

    final jsonStart = contentString.indexOf('```json') + '```json'.length;
    final jsonEnd = contentString.lastIndexOf('```');
    final jsonContent = contentString.substring(jsonStart, jsonEnd).trim();

    return quizListFromJson(jsonContent);
  }
}
