import 'dart:convert';

class ExemplarModel {
  final int id;
  final String name;
  final String downloadUrl;
  final String htmlUrl;
  final String subjectName;
  final String testName;

  ExemplarModel(
      {required this.id, required this.subjectName, required this.testName, required this.downloadUrl, required this.htmlUrl, required this.name});

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'downloadUrl': downloadUrl,
      'htmlUrl': htmlUrl,
      'subjectName': subjectName,
      'testName': testName,
    };
  }

  factory ExemplarModel.fromMap(Map<String, dynamic> map) {
    return ExemplarModel(
      id:map['id'] as int,
      name:map['name'] as String,
      downloadUrl:map['downloadUrl'] as String,
      htmlUrl:map['htmlUrl'] as String,
      subjectName:map['subjectName'] as String,
      testName:map['testName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExemplarModel.fromJson(String source) => ExemplarModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExemplarModel(id: $id, name: $name, downloadUrl: $downloadUrl, htmlUrl: $htmlUrl, subjectName: $subjectName, testName: $testName)';
  }
}
