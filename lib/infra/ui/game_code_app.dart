import 'package:flutter/material.dart';
import 'package:game_code/application/usecases/get_all_subjects_usecase.dart';
import 'package:game_code/infra/repositories_imp/supabase_subject_repository.dart';
import 'package:game_code/infra/ui/screens/home_screen.dart';
import 'package:game_code/infra/ui/theme/theme.dart';
import 'package:game_code/infra/viewmodels/home_view_model.dart';

class GameCodeApp extends StatelessWidget {
  const GameCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(homeViewModel: HomeViewModel(getAllSubjectsUsecase: GetAllSubjectsUsecase(subjectRepository: SupabaseSubjectRepository())),),
      theme: buildTheme(Brightness.light),
    );
  }
}
