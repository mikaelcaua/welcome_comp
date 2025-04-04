import 'package:welcome_comp/usecases/open_site_usecase.dart';

class HelpScreenViewModel {
  final OpenSiteUsecase openSiteUsecase;

  HelpScreenViewModel({required this.openSiteUsecase});

  Future<void> openSite(String url) async {
    await openSiteUsecase.execute(url);
  }
}
