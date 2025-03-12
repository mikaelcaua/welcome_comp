abstract class SystemRepository {
  Future<bool> requestPermissions();
  Future<String> downloadArchive(String url, String path);
}
