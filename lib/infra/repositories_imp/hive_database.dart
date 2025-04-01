import 'package:hive/hive.dart';
import '../../domain/models/subject_model.dart';
import '../../domain/repositories/database_offline_repository.dart';

class HiveDatabase implements DatabaseOfflineRepository {
  static const String _subjectsBox = 'subjectsBox';

  @override
  Future<void> saveSubjects(List<SubjectModel> subjects) async {
    final box = await Hive.openBox(_subjectsBox);
    final subjectsJson = subjects.map((subject) => subject.toJson()).toList();
    await box.put('subjects', subjectsJson);
  }

  @override
  Future<List<SubjectModel>> loadSubjects() async {
    final box = await Hive.openBox(_subjectsBox);
    final subjectsJson = box.get('subjects');
    if (subjectsJson == null) return [];

    return subjectsJson
        .map<SubjectModel>((subjectJson) => SubjectModel.fromJson(subjectJson))
        .toList();
  }

  @override
  Future<void> clearSubjects() async {
    final box = await Hive.openBox(_subjectsBox);
    await box.delete('subjects');
  }
}
