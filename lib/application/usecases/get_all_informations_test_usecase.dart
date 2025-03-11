import '../../domain/repositories/test_repository.dart';

abstract class GetAllInformationsTestUsecase {
  final TestRepository testRepository;
  final String testUrl;
  GetAllInformationsTestUsecase({required this.testRepository, required this.testUrl});

  dynamic execute(){
    return testRepository.getTestInformation(testUrl);
  }
}