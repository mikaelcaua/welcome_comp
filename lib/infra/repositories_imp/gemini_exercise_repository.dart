import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_code/domain/models/exercise_model.dart';
import 'package:game_code/domain/repositories/exercise_repository.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiExerciseRepository extends ExerciseRepository {
  final model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: dotenv.env['API_KEY']!,
  );

  @override
  Future<String> requestPrompt(String prompt) async {
    try {
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      return response.text!;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ExerciseModel> generateExercise({
    required String language,
    required String topic,
  }) async {
    try {
      var response = await requestPrompt(
        'Crie um exercício sobre $language no tópico $topic usando este esquema JSON:\n\n'
        '{"title": string, "content":string, "questions":list<string>}',
      );

      
      response = response.replaceAll('`json', '').replaceAll('`', '').replaceAll('"', '').trim();

      print(response);

      return ExerciseModel.fromJson(jsonDecode(response));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
