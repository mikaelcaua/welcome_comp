import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/models/exemplar_model.dart';
import '../../domain/repositories/test_exemplar_repository.dart';

class GithubRepository extends TestExemplarRepository {
  @override
  Future<List<ExemplarModel>> getTestExemplars(String url) async {
    try {
      var response = await http.get(Uri.parse(convertToApiUrl(url)));
      return ExemplarModel.convertListDynamicToListExemplar(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e);
    }
  }

  String convertToApiUrl(String githubUrl) {
  final regex = RegExp(r'https://github\.com/[^/]+/[^/]+/tree/master/(.+)');
  final match = regex.firstMatch(githubUrl);

  if (match != null) {
    final path = match.group(1); 

    return 'https://api.github.com/repos/elheremes/awesome-ufma/contents/$path';
  } else {
    throw Exception('URL inválida');
  }
}
}
