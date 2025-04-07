import '../domain/repositories/system_repository.dart';

class ShareArchiveUsecase {
    final SystemRepository systemRepository;
  ShareArchiveUsecase({required this.systemRepository});

  Future<void> execute(String filePath) async{
    await systemRepository.shareArchive(filePath);
  }
}