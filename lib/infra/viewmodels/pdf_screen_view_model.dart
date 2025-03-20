import '../../usecases/download_archive_usecase.dart';
import '../../usecases/get_pdf_download_consent_usecase.dart';
import '../../usecases/set_pdf_download_consent_usecase.dart';

class PdfScreenViewModel {
  final DownloadArchiveUsecase downloadArchiveUsecase;
  final GetPdfDownloadConsentUsecase getPdfDownloadConsentUsecase;
  final SetPdfDownloadConsentUsecase setPdfDownloadConsentUsecase;

  PdfScreenViewModel({
    required this.downloadArchiveUsecase,required this.getPdfDownloadConsentUsecase,required  this.setPdfDownloadConsentUsecase, 
  });

  Future<String> downloadArchive(String url, String path) async {
    return downloadArchiveUsecase.execute(url, path);
  }

  Future<bool> getPdfDownloadConsent() async {
    return getPdfDownloadConsentUsecase.execute();
  }

  Future<void> setPdfDownloadConsent(bool consent) async {
    await setPdfDownloadConsentUsecase.execute(consent);
  }
}