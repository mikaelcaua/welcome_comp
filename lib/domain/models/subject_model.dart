// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SubjectModel {
  final String title;
  final String description;

  SubjectModel({required this.title, required this.description});

  static List<SubjectModel> convertListMapToListSubjectModel(
      List<Map<String, dynamic>> lista) {
    return lista.map((s) => SubjectModel.fromMap(s)).toList();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromJson(String source) =>
      SubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SubjectModel(title: $title, description: $description)';
}
