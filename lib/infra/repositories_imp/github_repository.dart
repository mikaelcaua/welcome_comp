import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/models/exemplar_model.dart';
import '../../domain/repositories/test_exemplar_repository.dart';

class GithubRepository implements TestExemplarRepository {
  @override
  Future<List<ExemplarModel>> getTestExemplars(String url) async {
    try {
      final apiUrl = convertToApiUrl(url);
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return ExemplarModel.convertListDynamicToListExemplar(
          jsonDecode(response.body),
        );
      } else {
        throw Exception('Erro ao acessar a API: ${response.statusCode}');
      }
    } catch (e) {
      return Future.error('Erro ao se conectar com a API do GitHub: $e');
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
