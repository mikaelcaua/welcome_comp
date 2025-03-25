import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'infra/repositories_imp/shared_preferences_repository.dart';
import 'infra/repositories_imp/supabase_subject_repository.dart';
import 'infra/viewmodels/home_view_model.dart';
import 'infra/welcome_comp_app.dart';
import 'usecases/get_all_subjects_usecase.dart';
import 'usecases/load_all_subjects_offline_usecase.dart';
import 'usecases/save_all_subjects_offline_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel(
        loadAllSubjectsOfflineUsecase: LoadAllSubjectsOfflineUsecase(
          databaseOfflineRepository: SharedPreferencesDatabase(),
        ),
        saveAllSubjectsOfflineUsecase: SaveAllSubjectsOfflineUsecase(
          databaseOfflineRepository: SharedPreferencesDatabase(),
        ),
        getAllSubjectsUsecase: GetAllSubjectsUsecase(
          subjectRepository: SupabaseSubjectRepository(),
        ),
      ),),
      ],
      child: WelcomeCompApp(),
    ));
}