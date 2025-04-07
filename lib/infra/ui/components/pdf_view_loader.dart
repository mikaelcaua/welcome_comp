import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:welcome_comp/infra/ui/components/message_error.dart';

import '../theme/colors.dart';

class PdfViewLoader extends StatelessWidget {
  final Future<String> pdfFuture;

  const PdfViewLoader({super.key, required this.pdfFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: pdfFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          ));
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Center(
              child: MessageError(
                  message:
                      'Este app funciona offline, mas ainda estamos carregando esta prova.\n\nVerifique sua conexão com a internet e tente reabrir o arquivo!',
                  iconData: Icons.wifi_off),
            ),
          );
        } else if (snapshot.hasData) {
          return PDFView(filePath: snapshot.data!);
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Center(
              child: MessageError(
                  message: 'Erro ao carregar PDF',
                  iconData: Icons.error_outline),
            ),
          );
        }
      },
    );
  }
}
