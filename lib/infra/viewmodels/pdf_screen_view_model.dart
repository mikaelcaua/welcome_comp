import '../../usecases/download_archive_usecase.dart';
import '../../usecases/get_storage_consent_usecase.dart';
import '../../usecases/set_storage_consent_usecase.dart';
import '../../usecases/share_archive_usecase.dart';

class PdfScreenViewModel {
  final DownloadArchiveUsecase downloadArchiveUsecase;
  final GetStorageConsentUsecase getPdfDownloadConsentUsecase;
  final SetStorageConsentUsecase setPdfDownloadConsentUsecase;
  final ShareArchiveUsecase shareArchiveUsecase;

  PdfScreenViewModel({
    required this.shareArchiveUsecase,
    required this.downloadArchiveUsecase,
    required this.getPdfDownloadConsentUsecase,
    required this.setPdfDownloadConsentUsecase,
  });

  Future<String> downloadArchive(String url, String path) async {
    return downloadArchiveUsecase.execute(url, path);
  }

  Future<bool> getPdfDownloadConsent() async {
    return await getPdfDownloadConsentUsecase.execute();
  }

  Future<void> setPdfDownloadConsent() async {
    await setPdfDownloadConsentUsecase.execute();
  }

  Future<void> shareArchive(String filePath) async {
    await shareArchiveUsecase.execute(filePath);
  }
}
