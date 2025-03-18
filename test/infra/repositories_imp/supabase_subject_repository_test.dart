import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:welcome_comp/domain/models/subject_model.dart';
import 'package:welcome_comp/infra/repositories_imp/supabase_subject_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('should return all subjects', () async {
    await dotenv.load(fileName: '.env');
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    );
    var response =
        await SupabaseSubjectRepository().getSubjectsWithTestsAndExemplars();
    print(response);
    expect(response, isA<List<SubjectModel>>());
  });
}
