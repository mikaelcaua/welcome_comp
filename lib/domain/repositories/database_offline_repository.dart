import '../models/subject_model.dart';

abstract class DatabaseOfflineRepository {
  Future<void> saveSubjects(List<SubjectModel> subjects);

  Future<List<SubjectModel>> loadSubjects();

  Future<void> clearSubjects();
}
