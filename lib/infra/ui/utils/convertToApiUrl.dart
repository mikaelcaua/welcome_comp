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

