import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../viewmodels/pdf_screen_view_model.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({
    super.key,
    required this.downloadPdfPath,
    required this.pdfScreenViewModel,
    required this.filePath
  });

  final String downloadPdfPath;
  final String filePath;
  final PdfScreenViewModel pdfScreenViewModel;

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visualizando PDF')),
      body: FutureBuilder<String>(
        future: widget.pdfScreenViewModel.downloadArchive(widget.downloadPdfPath, widget.filePath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar PDF'));
          } else {
            return PDFView(filePath: snapshot.data!);
          }
        },
      ),
    );
  }
}
