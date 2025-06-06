import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import '../../domain/repositories/system_repository.dart';
import 'package:path_provider/path_provider.dart';

class SystemRepositoryImp implements SystemRepository {
  @override
  Future<String> downloadArchive(String url, String fileName) async {
    try {
      final Directory? externalDir = await getExternalStorageDirectory();
      if (externalDir == null) {
        throw Exception('Não foi possível obter o diretório de armazenamento');
      }

      final String filePath = '${externalDir.path}/$fileName';
      final File file = File(filePath);

      if (await file.exists()) {
        return filePath;
      } else {
        final http.Response response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          await file.writeAsBytes(response.bodyBytes);
          return filePath;
        } else {
          throw Exception('Falha ao baixar o arquivo: ${response.statusCode}');
        }
      }
    } catch (e) {
      throw Exception('Erro ao fazer download ou abrir o arquivo: $e');
    }
  }

  // @override
  // Future<bool> requestPermissions() async {
  //   final androidInfo = await DeviceInfoPlugin().androidInfo;

  //   if (androidInfo.version.sdkInt >= 30) {
  //     return await Permission.manageExternalStorage.request().isGranted;
  //   }

  //   final permission = Permission.storage;
  //   if (await permission.isGranted) return true;

  //   return await permission.request().isGranted;
  // }

  @override
  Future<bool> getStorageConsent() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('pdf_download_consent') ?? false;
  }

  @override
  Future<void> setStorageConsent() async {
    final prefs = await SharedPreferences.getInstance();
    // final result = await requestPermissions();
    await prefs.setBool('pdf_download_consent', true);
  }

  @override
  Future<void> openSite(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Não foi possível abrir o link');
    }
  }

  @override
  Future<void> shareArchive(String filePath) async {
    final Directory? externalDir = await getExternalStorageDirectory();
    if (externalDir == null) {
      throw Exception('Não foi possível obter o diretório de armazenamento');
    } else {
      debugPrint('${externalDir.path}/$filePath');
      await Share.shareXFiles([XFile('${externalDir.path}/$filePath')],
          text: 'Compartilhar PDF');
    }
  }
}
