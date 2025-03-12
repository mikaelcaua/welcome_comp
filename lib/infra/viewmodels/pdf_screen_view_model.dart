import '../../usecases/download_archive_usecase.dart';

class PdfScreenViewModel {
    final DownloadArchiveUsecase downloadArchiveUsecase;

  PdfScreenViewModel({required this.downloadArchiveUsecase});

  Future<String> downloadArchive(String url, String path) async {
    return downloadArchiveUsecase.execute(url,path);
  }
}
