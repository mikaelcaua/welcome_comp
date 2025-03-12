

import '../../domain/models/subject_model.dart';
import '../../domain/repositories/subject_repository.dart';

class GetAllSubjectsUsecase {
  final SubjectRepository subjectRepository;

  GetAllSubjectsUsecase({required this.subjectRepository});

  Future<List<SubjectModel>> execute() {
    return subjectRepository.getAllSubject();
  }
}
