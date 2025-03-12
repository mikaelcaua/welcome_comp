import '../../domain/models/exemplar_model.dart';
import '../../domain/repositories/test_exemplar_repository.dart';

class GetAllInformationsTestUsecase {
  final TestExemplarRepository testRepository;
  GetAllInformationsTestUsecase({required this.testRepository});

  Future<List<ExemplarModel>> execute(String testUrl) {
    return testRepository.getTestExemplars(testUrl);
  }
}
