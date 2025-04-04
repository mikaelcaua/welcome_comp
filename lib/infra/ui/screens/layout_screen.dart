import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';
import 'package:welcome_comp/infra/viewmodels/help_screen_view_model.dart';
import 'package:welcome_comp/usecases/open_site_usecase.dart';
import '../../../usecases/download_archive_usecase.dart';
import '../../../usecases/get_storage_consent_usecase.dart';
import '../../../usecases/set_storage_consent_usecase.dart';
import '../../repositories_imp/system_repository.dart';
import '../../viewmodels/pdf_screen_view_model.dart';
import 'help_screen.dart';
import 'home_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _indiceAtual = 0;
  late PdfScreenViewModel pdfScreenViewModel;

  @override
  void initState() {
    super.initState();
    pdfScreenViewModel = PdfScreenViewModel(
      downloadArchiveUsecase: DownloadArchiveUsecase(
        systemRepository: SystemRepositoryImp(),
      ),
      getPdfDownloadConsentUsecase: GetStorageConsentUsecase(
        systemRepository: SystemRepositoryImp(),
      ),
      setPdfDownloadConsentUsecase: SetStorageConsentUsecase(
        systemRepository: SystemRepositoryImp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> telas = [
      HomeScreen(pdfScreenViewModel: pdfScreenViewModel),
      HelpScreen(helpScreenViewModel: HelpScreenViewModel(openSiteUsecase: OpenSiteUsecase(systemRepository: SystemRepositoryImp())),),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: telas[_indiceAtual],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: tertiaryColor,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        selectedItemColor: whiteColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        selectedIconTheme: const IconThemeData(size: 32),
        unselectedIconTheme: const IconThemeData(size: 25),
        items: const [
          BottomNavigationBarItem(
            label: 'Início',
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Ajuda',
            icon: Icon(Icons.question_mark_outlined),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
