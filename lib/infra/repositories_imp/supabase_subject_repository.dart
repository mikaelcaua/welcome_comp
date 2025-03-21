import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/subject_model.dart';
import '../../domain/repositories/subject_repository.dart';
import 'shared_preferences_repository.dart'; 

class SupabaseSubjectRepository implements SubjectRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final SharedPreferencesDatabase _db = SharedPreferencesDatabase();

  @override
  Future<List<SubjectModel>> getSubjectsWithTestsAndExemplars() async {
    try {
      final response =
          await _supabaseClient.rpc('get_subjects_with_tests_and_exemplars');
      final subjects = SubjectModel.convertSqlResultToSubjectModels(response);
      return subjects;
    } catch (e) {
      return await _db.loadSubjects();
    }
  }
}