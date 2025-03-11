
import 'dart:convert';

class TestModel {
  final String gitUrl;
  final String videoUrl;

  TestModel({required this.gitUrl, required this.videoUrl});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gitUrl': gitUrl,
      'videoUrl': videoUrl,
    };
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      gitUrl: map['gitUrl'] as String,
      videoUrl: map['videoUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TestModel.fromJson(String source) => TestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TestModel(gitUrl: $gitUrl, videoUrl: $videoUrl)';
}
