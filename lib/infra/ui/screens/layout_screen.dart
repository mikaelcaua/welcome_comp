import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';
import '../../../usecases/download_archive_usecase.dart';
import '../../../usecases/get_pdf_download_consent_usecase.dart';
import '../../../usecases/set_pdf_download_consent_usecase.dart';
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
  late PdfScreenViewModel pdfScreenViewModel; // Declare o ViewModel aqui

  @override
  void initState() {
    super.initState();
    // Inicialize o ViewModel apenas uma vez
    pdfScreenViewModel = PdfScreenViewModel(
      downloadArchiveUsecase: DownloadArchiveUsecase(
        systemRepository: SystemRepositoryImp(),
      ),
      getPdfDownloadConsentUsecase: GetPdfDownloadConsentUsecase(
        systemRepository: SystemRepositoryImp(),
      ),
      setPdfDownloadConsentUsecase: SetPdfDownloadConsentUsecase(
        systemRepository: SystemRepositoryImp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> telas = [
      HomeScreen(pdfScreenViewModel: pdfScreenViewModel), // Use a instância reutilizada
      HelpScreen(),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 25),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
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