import 'package:game_code/application/usecases/get_all_subjects_usecase.dart';
import 'package:game_code/domain/models/subject_model.dart';

class HomeViewModel{
  final GetAllSubjectsUsecase getAllSubjectsUsecase;

  HomeViewModel({required this.getAllSubjectsUsecase});

  Future<List<SubjectModel>> getAllSubjects() async {
    return await getAllSubjectsUsecase.execute();
  }

}
