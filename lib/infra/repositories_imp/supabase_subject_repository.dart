import 'package:game_code/domain/models/subject_model.dart';
import 'package:game_code/domain/repositories/subject_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseSubjectRepository extends SubjectRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  @override
  Future<List<SubjectModel>> getAllSubject() async {
    try {
      var response = await _supabaseClient.from('subjects').select();
      var convert = SubjectModel.convertListMapToListSubjectModel(response);
      return convert;
    } catch (e) {
      throw Exception(e);
    }
  }
}
