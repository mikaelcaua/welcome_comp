
import '../../usecases/get_all_subjects_usecase.dart';
import '../../domain/models/subject_model.dart';

class HomeViewModel{
  final GetAllSubjectsUsecase getAllSubjectsUsecase;

  HomeViewModel({required this.getAllSubjectsUsecase});

  Future<List<SubjectModel>> getAllSubjects() async {
    return await getAllSubjectsUsecase.execute();
  }

}
