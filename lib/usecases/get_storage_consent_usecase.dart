import '../domain/repositories/system_repository.dart';

class GetStorageConsentUsecase {
  final SystemRepository systemRepository;
  GetStorageConsentUsecase({required this.systemRepository});

  Future<bool> execute() async{
    return await systemRepository.getStorageConsent();
  }
}
