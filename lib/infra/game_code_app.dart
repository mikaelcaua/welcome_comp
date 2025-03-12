import 'package:flutter/material.dart';
import '../application/usecases/get_all_informations_test_usecase.dart';
import '../application/usecases/get_all_subjects_usecase.dart';
import 'repositories_imp/github_repository.dart';
import 'repositories_imp/supabase_subject_repository.dart';
import 'ui/screens/home_screen.dart';
import 'ui/theme/theme.dart';
import 'viewmodels/home_view_model.dart';
import 'viewmodels/subject_view_model.dart';


class GameCodeApp extends StatelessWidget {
  const GameCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(homeViewModel: HomeViewModel(getAllSubjectsUsecase: GetAllSubjectsUsecase(subjectRepository: SupabaseSubjectRepository())),subjectViewModel: SubjectViewModel(getAllInformationsTestUsecase: GetAllInformationsTestUsecase(testRepository: GithubRepository())),),
      theme: buildTheme(Brightness.light),
    );
  }
}
