import 'package:flutter_test/flutter_test.dart';
import 'package:game_code/infra/repositories_imp/github_repository.dart';

void main(){
  group('GithubRepository', () {
    test('should return a list of repositories', () async {
      var result = await GithubRepository().getTestInformation('https://api.github.com/repos/elheremes/awesome-ufma');
      print(result);
      expect(result, isA<dynamic>());
    });
  });
}