import 'dart:convert';

class ExerciseModel {
  final String title;
  final String content;
  final List<String> alternatives;

  ExerciseModel({
    required this.title,
    required this.content,
    required this.alternatives,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'alternatives': alternatives,
    };
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      title: map['title'] as String,
      content: map['content'] as String,
      alternatives: List<String>.from((map['alternatives'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseModel.fromJson(String source) =>
      ExerciseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ExerciseModel(title: $title, content: $content, alternatives: $alternatives)';
}
