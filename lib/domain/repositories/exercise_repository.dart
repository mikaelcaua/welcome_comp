import '../models/exercise_model.dart';

abstract class ExerciseRepository {
  Future<ExerciseModel> generateExercise({
    required String language,
    required String topic,
  });
}
