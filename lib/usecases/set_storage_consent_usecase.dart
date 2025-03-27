import '../domain/repositories/system_repository.dart';

class SetStorageConsentUsecase {
  final SystemRepository systemRepository;
  SetStorageConsentUsecase({required this.systemRepository});

  execute(bool consent) async{
    return await systemRepository.setStorageConsent(consent);
  }
}
