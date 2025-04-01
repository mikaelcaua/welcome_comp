import '../domain/repositories/system_repository.dart';

class SetStorageConsentUsecase {
  final SystemRepository systemRepository;
  SetStorageConsentUsecase({required this.systemRepository});

  Future<void> execute() async{
    await systemRepository.setStorageConsent();
  }
}
