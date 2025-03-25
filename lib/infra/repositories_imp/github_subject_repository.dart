import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:welcome_comp/domain/models/exemplar_model.dart';
import 'package:welcome_comp/domain/models/subject_model.dart';
import 'package:welcome_comp/domain/models/test_model.dart';

class GithubSubjectRepository {
  Future<List<SubjectModel>> getSubjectsWithTestsAndExemplars() async {
    List<SubjectModel> subjectsConverted = [];

    try {
      final response = await http.get(Uri.parse('https://api.github.com/repos/elheremes/awesome-ufma/contents/'));

      var subjects = jsonDecode(response.body);

      for (var e in subjects) {
        if (e['name'] == '.gitignore') {
          continue;
        }

        String url = e['url'].toString().replaceAll('?ref=master', '');
        SubjectModel subjectModel = SubjectModel(
          id: 0,
          description: '',
          name: e['name'],
          tests: [],
        );
        subjectsConverted.add(subjectModel);
        
        try {
          final testsResponse = await http.get(Uri.parse(url));
          var tests = jsonDecode(testsResponse.body);

          if (tests is! List) {
            throw Exception('Expected a list of tests for subject: ${subjectModel.name}, but got: ${tests.runtimeType}');
          }

          for (var test in tests) {
            String testUrl = test['url'].toString().replaceAll('?ref=master', 'replace');

            TestModel testModel = TestModel(
              listExemplarModel: [],
              id: 0,
              name: test['name'],
              gitUrl: test['git_url'],
              videoUrl: test['video_url'],
            );

            subjectModel.tests.add(testModel);
            print('Adding test: ${testModel.name} to subject: ${subjectModel.name}');

            try {
              final exemplarsResponse = await http.get(Uri.parse(testUrl));
              if (exemplarsResponse.statusCode != 200) {
                throw Exception('Failed to load exemplars for test: ${testModel.name}. Status code: ${exemplarsResponse.statusCode}');
              }

              var exemplars = jsonDecode(exemplarsResponse.body);

              if (exemplars is! List) {
                throw Exception('Expected a list of exemplars for test: ${testModel.name}, but got: ${exemplars.runtimeType}');
              }

              for (var exemplar in exemplars) {
                ExemplarModel exemplarModel = ExemplarModel(
                  id: 0,
                  subjectName: subjectModel.name,
                  testName: testModel.name,
                  downloadUrl: exemplar['download_url'],
                  htmlUrl: exemplar['html_url'],
                  name: exemplar['name'],
                );

                testModel.listExemplarModel.add(exemplarModel);
                print('Adding exemplar: ${exemplarModel.name} to test: ${testModel.name}');
              }
            } catch (exemplarError) {
              print('Error loading exemplars for test: ${testModel.name}. Error: $exemplarError');
            }
          }
        } catch (testError) {
          print('Error loading tests for subject: ${subjectModel.name}. Error: $testError');
        }
      }
    } catch (e) {
      print('Error: $e');
    }

    return subjectsConverted;
  }
}
