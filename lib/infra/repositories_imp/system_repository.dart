import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import '../../domain/repositories/system_repository.dart';

class SystemRepositoryImp implements SystemRepository {
  @override
  Future<String> downloadArchive(String url, String path) async {
    try {
      await requestPermissions();

      var dir = await getExternalStorageDirectory();
      if (dir == null) {
        throw 'Não foi possível obter o diretório de Downloads';
      }

      String filePath = '/storage/emulated/0/Download/$path';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return filePath;
      } else {
        throw Exception('Falha ao baixar o arquivo: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao fazer download ou abrir o PDF: $e');
    }
  }

  @override
  Future<bool> requestPermissions() async {
    try {
      PermissionStatus status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
