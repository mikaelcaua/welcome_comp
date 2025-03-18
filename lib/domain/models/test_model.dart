
import 'dart:convert';
import 'exemplar_model.dart';

class TestModel {
  final int id;
  final String name;
  final String gitUrl;
  final String videoUrl;
  final List<ExemplarModel> listExemplarModel;

  TestModel(
      {required this.listExemplarModel,
      required this.id,
      required this.name,
      required this.gitUrl,
      required this.videoUrl});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gitUrl': gitUrl,
      'videoUrl': videoUrl,
      'listExemplarModel': listExemplarModel.map((x) => x.toMap()).toList(),
    };
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      id:map['id'],
      name:map['name'] as String,
      gitUrl:map['gitUrl'] as String,
      videoUrl:map['videoUrl'] as String,
      listExemplarModel:List<ExemplarModel>.from((map['listExemplarModel'] as List<int>).map<ExemplarModel>((x) => ExemplarModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory TestModel.fromJson(String source) => TestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TestModel(id: $id, name: $name, gitUrl: $gitUrl, videoUrl: $videoUrl, listExemplarModel: $listExemplarModel)';
  }
}
