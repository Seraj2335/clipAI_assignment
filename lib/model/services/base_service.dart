abstract class BaseService {
  final String groqBaseUrl = "https://api.groq.com/openai/v1/chat/completions";

  Future<dynamic> getResponse(String url);
}
