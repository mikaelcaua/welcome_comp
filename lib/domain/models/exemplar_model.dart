
import 'dart:convert';

class ExemplarModel {
  final String name;
  final String downloadUrl;
  final String htmlUrl;
  late String subjectName;
  late String testName;

  ExemplarModel(
      {required this.downloadUrl, required this.htmlUrl, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'download_url': downloadUrl,
      'html_url': htmlUrl,
    };
  }

  factory ExemplarModel.fromMap(Map<String, dynamic> map) {
    return ExemplarModel(
      name: map['name'] as String,
      downloadUrl: map['download_url'] as String,
      htmlUrl: map['html_url'] as String,
    );
  }

  static List<ExemplarModel> convertListDynamicToListExemplar(
      List<dynamic> lista) {
    return lista.map((e) => ExemplarModel.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory ExemplarModel.fromJson(String source) =>
      ExemplarModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ExemplarModel(name: $name, downloadUrl: $downloadUrl, htmlUrl: $htmlUrl)';
}
