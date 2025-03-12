import '../domain/models/exemplar_model.dart';
import '../../domain/repositories/test_exemplar_repository.dart';

class GetAllInformationsTestUsecase {
  final TestExemplarRepository testExemplarRepository;
  GetAllInformationsTestUsecase({required this.testExemplarRepository});

  Future<List<ExemplarModel>> execute(String testUrl) {
    try {
      return testExemplarRepository.getTestExemplars(testUrl);
    } catch (e) {
      rethrow;
    }
  }
}
