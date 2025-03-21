import 'package:welcome_comp/domain/models/subject_model.dart';
import 'package:welcome_comp/domain/repositories/database_offline_repository.dart';

class SaveAllSubjectsOfflineUsecase {
  final DatabaseOfflineRepository databaseOfflineRepository;

  SaveAllSubjectsOfflineUsecase({required this.databaseOfflineRepository});
  
  Future<void> execute(List<SubjectModel> subjects) async {
    await databaseOfflineRepository.saveSubjects(subjects);
  }

}