

import 'package:game_code/domain/repositories/test_repository.dart';
import 'package:http/http.dart' as http;

class GithubRepository extends TestRepository {
  @override
  dynamic getTestInformation(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      return response.body;
    } catch (e) {
      throw Exception(e);
    }
  }
}
