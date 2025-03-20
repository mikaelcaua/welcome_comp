import '../domain/repositories/system_repository.dart';

class GetPdfDownloadConsentUsecase {
  final SystemRepository systemRepository;
  GetPdfDownloadConsentUsecase({required this.systemRepository});

  Future<bool> execute() async{
    return await systemRepository.getPdfDownloadConsent();
  }
}
