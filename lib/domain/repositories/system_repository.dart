abstract class SystemRepository {
  Future<String> downloadArchive(String url, String path);
  Future<bool> requestPermissions();
  Future<bool> getStorageConsent();
  Future<void> setStorageConsent();
}