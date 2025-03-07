import 'package:game_code/domain/models/exercise_model.dart';
import 'package:game_code/domain/repositories/exercise_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseExerciseRepository extends ExerciseRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  @override
  Future<ExerciseModel> generateExercise({
    required String language,
    required String topic,
  }) async {
    try {
      var response =
          (await _supabaseClient.from('exercises').select());
      print(response);

      return ExerciseModel.fromMap(response[0]);
    } catch (e) {
      throw Exception(e);
    }
  }
}
