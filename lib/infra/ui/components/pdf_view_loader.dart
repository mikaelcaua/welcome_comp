import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';
import 'package:welcome_comp/infra/ui/theme/fonts.dart';

class PdfViewLoader extends StatelessWidget {
  final Future<String> pdfFuture;

  const PdfViewLoader({super.key, required this.pdfFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: pdfFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Erro ao carregar PDF, verifique sua conexão com a internet!',
                  style: h3Text.copyWith(color: whiteColor),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.wifi,
                  size: 40,
                )
              ],
            ),
          );
        } else if (snapshot.hasData) {
          return PDFView(filePath: snapshot.data!);
        } else {
          return const Center(child: Text('Erro desconhecido'));
        }
      },
    );
  }
}
