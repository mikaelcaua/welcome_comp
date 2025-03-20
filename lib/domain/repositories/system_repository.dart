abstract class SystemRepository {
  Future<String> downloadArchive(String url, String path);
  Future<bool> requestPermissions();
  Future<bool> getPdfDownloadConsent();
  Future<void> setPdfDownloadConsent(bool consent);
}