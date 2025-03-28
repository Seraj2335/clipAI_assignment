// To parse this JSON data, do
//
//     final quizResponse = quizResponseFromJson(jsonString);

import 'dart:convert';

QuizResponse quizResponseFromJson(String str) => QuizResponse.fromJson(json.decode(str));

String quizResponseToJson(QuizResponse data) => json.encode(data.toJson());

class QuizResponse {
  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final List<Choice>? choices;
  final Usage? usage;
  final String? systemFingerprint;
  final XGroq? xGroq;

  QuizResponse({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.usage,
    this.systemFingerprint,
    this.xGroq,
  });

  factory QuizResponse.fromJson(Map<String, dynamic> json) => QuizResponse(
    id: json["id"],
    object: json["object"],
    created: json["created"],
    model: json["model"],
    choices: json["choices"] == null ? [] : List<Choice>.from(json["choices"]!.map((x) => Choice.fromJson(x))),
    usage: json["usage"] == null ? null : Usage.fromJson(json["usage"]),
    systemFingerprint: json["system_fingerprint"],
    xGroq: json["x_groq"] == null ? null : XGroq.fromJson(json["x_groq"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "created": created,
    "model": model,
    "choices": choices == null ? [] : List<dynamic>.from(choices!.map((x) => x.toJson())),
    "usage": usage?.toJson(),
    "system_fingerprint": systemFingerprint,
    "x_groq": xGroq?.toJson(),
  };
}

class Choice {
  final int? index;
  final Message? message;
  final dynamic logprobs;
  final String? finishReason;

  Choice({
    this.index,
    this.message,
    this.logprobs,
    this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    index: json["index"],
    message: json["message"] == null ? null : Message.fromJson(json["message"]),
    logprobs: json["logprobs"],
    finishReason: json["finish_reason"],
  );

  Map<String, dynamic> toJson() => {
    "index": index,
    "message": message?.toJson(),
    "logprobs": logprobs,
    "finish_reason": finishReason,
  };
}

class Message {
  final String? role;
  final String? content;

  Message({
    this.role,
    this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    role: json["role"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "content": content,
  };
}

class Usage {
  final double? queueTime;
  final int? promptTokens;
  final double? promptTime;
  final int? completionTokens;
  final double? completionTime;
  final int? totalTokens;
  final double? totalTime;

  Usage({
    this.queueTime,
    this.promptTokens,
    this.promptTime,
    this.completionTokens,
    this.completionTime,
    this.totalTokens,
    this.totalTime,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
    queueTime: json["queue_time"]?.toDouble(),
    promptTokens: json["prompt_tokens"],
    promptTime: json["prompt_time"]?.toDouble(),
    completionTokens: json["completion_tokens"],
    completionTime: json["completion_time"]?.toDouble(),
    totalTokens: json["total_tokens"],
    totalTime: json["total_time"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "queue_time": queueTime,
    "prompt_tokens": promptTokens,
    "prompt_time": promptTime,
    "completion_tokens": completionTokens,
    "completion_time": completionTime,
    "total_tokens": totalTokens,
    "total_time": totalTime,
  };
}

class XGroq {
  final String? id;

  XGroq({
    this.id,
  });

  factory XGroq.fromJson(Map<String, dynamic> json) => XGroq(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
