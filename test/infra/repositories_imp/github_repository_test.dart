import 'package:flutter_test/flutter_test.dart';
import 'package:welcome_comp/domain/models/exemplar_model.dart';
import 'package:welcome_comp/infra/repositories_imp/github_repository.dart';

void main() {
  group('GithubRepository', () {
    test('should return a list of repositories', () async {
      var result = await GithubRepository().getTestExemplars(
          'https://github.com/elheremes/awesome-ufma/tree/master/Algoritimos%20I/Prova%201');
      print(result);
      expect(result, isA<List<ExemplarModel>>());
    });
  });
}
