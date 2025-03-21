import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/subject_model.dart';
import '../../domain/repositories/database_offline_repository.dart';


class SharedPreferencesDatabase implements DatabaseOfflineRepository {
  static const String _subjectsKey = 'subjects';

  @override
  Future<void> saveSubjects(List<SubjectModel> subjects) async {
    final prefs = await SharedPreferences.getInstance();
    final subjectsJson = subjects.map((subject) => subject.toJson()).toList();
    await prefs.setStringList(_subjectsKey, subjectsJson);
  }

  @override
  Future<List<SubjectModel>> loadSubjects() async {
    final prefs = await SharedPreferences.getInstance();
    final subjectsJson = prefs.getStringList(_subjectsKey);
    if (subjectsJson == null) return [];

    return subjectsJson
        .map((subjectJson) => SubjectModel.fromJson(subjectJson))
        .toList();
  }

  @override
  Future<void> clearSubjects() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_subjectsKey);
  }
}