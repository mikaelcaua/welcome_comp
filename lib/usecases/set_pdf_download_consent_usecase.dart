import '../domain/repositories/system_repository.dart';

class SetPdfDownloadConsentUsecase {
  final SystemRepository systemRepository;
  SetPdfDownloadConsentUsecase({required this.systemRepository});

  execute(bool consent) async{
    return await systemRepository.setPdfDownloadConsent(consent);
  }
}
