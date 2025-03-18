import 'package:flutter/material.dart';
import '../usecases/download_archive_usecase.dart';
import '../usecases/get_all_subjects_usecase.dart';
import 'repositories_imp/supabase_subject_repository.dart';
import 'repositories_imp/system_repository.dart';
import 'ui/screens/home_screen.dart';
import 'ui/theme/theme.dart';
import 'viewmodels/home_view_model.dart';
import 'viewmodels/pdf_screen_view_model.dart';


class GameCodeApp extends StatelessWidget {
  const GameCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        pdfScreenViewModel: PdfScreenViewModel(downloadArchiveUsecase: DownloadArchiveUsecase(systemRepository: SystemRepositoryImp())),
        homeViewModel: HomeViewModel(
            getAllSubjectsUsecase: GetAllSubjectsUsecase(
                subjectRepository: SupabaseSubjectRepository())),
      ),
      theme: buildTheme(Brightness.light),
    );
  }
}
