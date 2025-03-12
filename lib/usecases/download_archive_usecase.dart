import 'package:welcome_comp/domain/repositories/system_repository.dart';

class DownloadArchiveUsecase {
  final SystemRepository systemRepository;
  DownloadArchiveUsecase({required this.systemRepository});

  Future<String> execute(String url, String path) async{
    return await systemRepository.downloadArchive(url, path);
  }
}
