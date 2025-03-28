import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../apis/api_exceptions.dart';
import 'base_service.dart';

class QuizService extends BaseService {
  @override
  Future getResponse(String category) async {
    final String apiKey = dotenv.env['GROQ_API_KEY'] ?? '';

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(groqBaseUrl),
          headers: {
            "Authorization": "Bearer $apiKey",
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "model": "llama-3.3-70b-versatile",
            "messages": [
              {
                "role": "user",
                "content": "Create a list jsondata 0f format ${{
                  "question": " ",
                  "options": ["", "", "", ""],
                  "answer": ""
                }} of length 5 quizzes with 4 options of $category category"
              }
            ]
          }));
      print('>>>>>>>> API called');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server'
            ' with status code : ${response.statusCode}');
    }
  }
}
