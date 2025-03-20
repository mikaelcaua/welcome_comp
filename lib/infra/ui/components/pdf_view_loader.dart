import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

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
          return const Center(child: Text('Erro ao carregar PDF'));
        } else if (snapshot.hasData) {
          return PDFView(filePath: snapshot.data!);
        } else {
          return const Center(child: Text('Erro desconhecido'));
        }
      },
    );
  }
}