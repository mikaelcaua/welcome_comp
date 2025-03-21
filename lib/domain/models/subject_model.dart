import 'dart:convert';
import 'exemplar_model.dart';
import 'test_model.dart';

class SubjectModel {
  final int id;
  final String name;
  final String description;
  final List<TestModel> tests;

  SubjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.tests,
  });

  static List<SubjectModel> convertSqlResultToSubjectModels(
    List<dynamic> sqlResults) {

    Map<int, SubjectModel> subjectsMap = {};

    for (var row in sqlResults) {

      int subjectId = row['subjects_id'];
      String subjectName = row['subjects_name'];
      String subjectDescription = row['subjects_description'];

      if (!subjectsMap.containsKey(subjectId)) {
        print('Criando novo SubjectModel para subjectId: $subjectId');
        subjectsMap[subjectId] = SubjectModel(
          id: subjectId,
          name: subjectName,
          description: subjectDescription,
          tests: [],
        );
      }

      if (row['tests_id'] != null) {
        int testId = row['tests_id'];
        String testName = row['tests_name'];
        String gitUrl = row['tests_giturl'];
        String videoUrl = row['tests_videourl'];

        TestModel? existingTest = subjectsMap[subjectId]!.tests.firstWhere(
          (test) => test.id == testId,
          orElse: () => TestModel(
            id: -1,
            name: '',
            gitUrl: '',
            videoUrl: '',
            listExemplarModel: [],
          ),
        );

        if (existingTest.id == -1) {
          subjectsMap[subjectId]!.tests.add(TestModel(
            id: testId,
            name: testName,
            gitUrl: gitUrl,
            videoUrl: videoUrl,
            listExemplarModel: [],
          ));
        }

        if (row['exemplars_id'] != null) {
          int exemplarId = row['exemplars_id'];
          String exemplarName = row['exemplars_name'];
          String downloadUrl = row['exemplars_downloadurl'];
          String htmlUrl = row['exemplars_htmlurl'];

          ExemplarModel exemplar = ExemplarModel(
            id: exemplarId,
            name: exemplarName,
            downloadUrl: downloadUrl,
            htmlUrl: htmlUrl,
            subjectName: subjectName,
            testName: testName,
          );

          TestModel testToUpdate = subjectsMap[subjectId]!.tests.firstWhere(
            (test) => test.id == testId,
          );

          testToUpdate.listExemplarModel.add(exemplar);
        }
      }
    }

    return subjectsMap.values.toList();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'tests': tests.map((x) => x.toMap()).toList(),
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'],
      name: map['name'] as String,
      description: map['description'] as String,
      tests: List<TestModel>.from(
        (map['tests'] as List<dynamic>).map<TestModel>(
          (x) => TestModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromJson(String source) =>
      SubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubjectModel(id: $id, name: $name, description: $description, tests: $tests)';
  }
}