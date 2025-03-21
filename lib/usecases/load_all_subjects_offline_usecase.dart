import 'package:welcome_comp/domain/models/subject_model.dart';
import 'package:welcome_comp/domain/repositories/database_offline_repository.dart';

class LoadAllSubjectsOfflineUsecase {
  final DatabaseOfflineRepository databaseOfflineRepository;

  LoadAllSubjectsOfflineUsecase({required this.databaseOfflineRepository});
  
  Future<List<SubjectModel>> execute() async {
    return await databaseOfflineRepository.loadSubjects();
  }

}