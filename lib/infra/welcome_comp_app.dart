import 'package:flutter/material.dart';
import 'package:welcome_comp/usecases/load_all_subjects_offline_usecase.dart';
import '../usecases/download_archive_usecase.dart';
import '../usecases/get_all_subjects_usecase.dart';
import '../usecases/get_pdf_download_consent_usecase.dart';
import '../usecases/save_all_subjects_offline_usecase.dart';
import '../usecases/set_pdf_download_consent_usecase.dart';
import 'repositories_imp/shared_preferences_repository.dart';
import 'repositories_imp/supabase_subject_repository.dart';
import 'repositories_imp/system_repository.dart';
import 'ui/screens/home_screen.dart';
import 'ui/theme/theme.dart';
import 'viewmodels/home_view_model.dart';
import 'viewmodels/pdf_screen_view_model.dart';

class WelcomeCompApp extends StatelessWidget {
  const WelcomeCompApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        pdfScreenViewModel: PdfScreenViewModel(
          downloadArchiveUsecase: DownloadArchiveUsecase(
            systemRepository: SystemRepositoryImp(),
          ),
          getPdfDownloadConsentUsecase: GetPdfDownloadConsentUsecase(
            systemRepository: SystemRepositoryImp(),
          ),
          setPdfDownloadConsentUsecase: SetPdfDownloadConsentUsecase(
            systemRepository: SystemRepositoryImp(),
          ),
        ),
        homeViewModel: HomeViewModel(
          loadAllSubjectsOfflineUsecase: LoadAllSubjectsOfflineUsecase(databaseOfflineRepository: SharedPreferencesDatabase()),
          saveAllSubjectsOfflineUsecase: SaveAllSubjectsOfflineUsecase(
            databaseOfflineRepository: SharedPreferencesDatabase(),
          ),
          getAllSubjectsUsecase: GetAllSubjectsUsecase(
            subjectRepository: SupabaseSubjectRepository(),
          ),
        ),
      ),
      theme: buildTheme(Brightness.light),
    );
  }
}
