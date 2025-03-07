import 'dart:convert';
import 'package:game_code/domain/models/test_model.dart';

class SubjectModel {
  final String title;
  final String description;
  final List<TestModel> tests;

  SubjectModel(
      {required this.title, required this.description, required this.tests});

  static List<SubjectModel> convertListMapToListSubjectModel(
      List<dynamic> lista) {
    Map<int, SubjectModel> subjectMap = {};

    for (var item in lista) {
      if (!subjectMap.containsKey(item['subject_id'])) {
        subjectMap[item['subject_id']] = SubjectModel(
          title: item['title'],
          description: item['description'],
          tests: [],
        );
      }

      TestModel test = TestModel(
        gitUrl: item['giturl'],
        videoUrl: item['videourl'],
      );

      subjectMap[item['subject_id']]?.tests.add(test);
    }

    List<SubjectModel> subjects = subjectMap.values.toList();
    return subjects;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'tests': tests.map((x) => x.toMap()).toList(),
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      title: map['title'] as String,
      description: map['description'] as String,
      tests: List<TestModel>.from(
        (map['tests'] as List).map<TestModel>(
            (x) => TestModel.fromMap(x as Map<String, dynamic>)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromJson(String source) =>
      SubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SubjectModel(title: $title, description: $description, tests: $tests)';
}
