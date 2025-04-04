import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/repositories/system_repository.dart';

class SystemRepositoryImp implements SystemRepository {
  @override
  Future<String> downloadArchive(String url, String path) async {
    try {
      var dir = await getExternalStorageDirectory();
      if (dir == null) {
        throw 'Não foi possível obter o diretório de Downloads';
      }

      String filePath = '/storage/emulated/0/Download/$path';
      File file = File(filePath);

      if (await file.exists()) {
        return filePath;
      } else {
        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          await file.writeAsBytes(response.bodyBytes);
          return filePath;
        } else {
          throw Exception('Falha ao baixar o arquivo: ${response.statusCode}');
        }
      }
    } catch (e) {
      throw Exception('Erro ao fazer download ou abrir o PDF: $e');
    }
  }

  @override
  Future<bool> requestPermissions() async {
    Permission permission = Permission.storage;
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    if (build.version.sdkInt >= 30) {
      var re = await Permission.manageExternalStorage.request();
      if (re.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      if (await permission.isGranted) {
        return true;
      } else {
        var result = await permission.request();
        if (result.isGranted) {
          return true;
        } else {
          return false;
        }
      }
    }
  }

  @override
  Future<bool> getStorageConsent() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('pdf_download_consent') ?? false;
  }

  @override
  Future<void> setStorageConsent() async {
    final prefs = await SharedPreferences.getInstance();
    bool result = false;

    result = await requestPermissions();

    await prefs.setBool('pdf_download_consent', result);
  }
  
  @override
  Future<void> openSite(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Não foi possível abrir o Link');
    }
  }
}
