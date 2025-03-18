
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/subject_model.dart';
import '../../domain/repositories/subject_repository.dart';

class SupabaseSubjectRepository implements SubjectRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  @override
  Future<List<SubjectModel>> getSubjectsWithTestsAndExemplars() async {
    try {
      final response = await _supabaseClient.rpc('get_subjects_with_tests_and_exemplars');
      var convert = SubjectModel.convertSqlResultToSubjectModels(response);
      return convert;
    } catch (e) {
      throw Exception(e);
    }
  }
}
