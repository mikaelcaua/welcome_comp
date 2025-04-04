import 'package:welcome_comp/domain/repositories/system_repository.dart';

class OpenSiteUsecase {
  final SystemRepository systemRepository;

  OpenSiteUsecase({required this.systemRepository});

  Future<void> execute(String url) async {
    await systemRepository.openSite(url);
  }
}
