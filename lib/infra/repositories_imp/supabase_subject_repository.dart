import 'package:game_code/domain/models/subject_model.dart';
import 'package:game_code/domain/repositories/subject_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseSubjectRepository extends SubjectRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  @override
  Future<List<SubjectModel>> getAllSubject() async {
    try {
      final response = await _supabaseClient.rpc('get_subjects_with_tests');
      print(response);
      var convert = SubjectModel.convertListMapToListSubjectModel(response);
      return convert;
    } catch (e) {
      throw Exception(e);
    }
  }
}
