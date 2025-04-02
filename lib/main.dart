import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';
import 'infra/repositories_imp/hive_database.dart';
import 'infra/repositories_imp/supabase_subject_repository.dart';
import 'infra/viewmodels/home_view_model.dart';
import 'infra/welcome_comp_app.dart';
import 'usecases/get_all_subjects_usecase.dart';
import 'usecases/load_all_subjects_offline_usecase.dart';
import 'usecases/save_all_subjects_offline_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,  
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: tertiaryColor, 
    systemNavigationBarIconBrightness: Brightness.light, 
  ));
  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => HomeViewModel(
          loadAllSubjectsOfflineUsecase: LoadAllSubjectsOfflineUsecase(
            databaseOfflineRepository: HiveDatabase(),
          ),
          saveAllSubjectsOfflineUsecase: SaveAllSubjectsOfflineUsecase(
            databaseOfflineRepository: HiveDatabase(),
          ),
          getAllSubjectsUsecase: GetAllSubjectsUsecase(
            subjectRepository: SupabaseSubjectRepository(),
          ),
        ),
      ),
    ],
    child: WelcomeCompApp(),
  ));
}
