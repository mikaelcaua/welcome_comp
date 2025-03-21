import '../../usecases/get_all_subjects_usecase.dart';
import '../../domain/models/subject_model.dart';
import '../../usecases/load_all_subjects_offline_usecase.dart';
import '../../usecases/save_all_subjects_offline_usecase.dart';

class HomeViewModel{
  final GetAllSubjectsUsecase getAllSubjectsUsecase;
  final SaveAllSubjectsOfflineUsecase saveAllSubjectsOfflineUsecase;
  final LoadAllSubjectsOfflineUsecase loadAllSubjectsOfflineUsecase;

  HomeViewModel({required this.loadAllSubjectsOfflineUsecase, required this.saveAllSubjectsOfflineUsecase, required this.getAllSubjectsUsecase});

  Future<List<SubjectModel>> getAllSubjects() async {
    try{
final subjects = await getAllSubjectsUsecase.execute();
    await saveAllSubjectsOfflineUsecase.execute(subjects);
    return subjects;
    }catch(e){
      return await loadAllSubjectsOfflineUsecase.execute();
    }
  }

}
