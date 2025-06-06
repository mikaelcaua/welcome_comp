import 'package:flutter/material.dart';
import '../../viewmodels/pdf_screen_view_model.dart';
import 'pdf_view_loader.dart';
import '../theme/colors.dart';
import 'consent_request_screen.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({
    super.key,
    required this.downloadPdfPath,
    required this.pdfScreenViewModel,
    required this.filePath,
  });

  final String downloadPdfPath;
  final String filePath;
  final PdfScreenViewModel pdfScreenViewModel;

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  bool _isDownloading = false;
  bool _consentGiven = false;

  @override
  void initState() {
    super.initState();
    _checkConsent();
  }

  Future<void> _checkConsent() async {
    _consentGiven = await widget.pdfScreenViewModel.getPdfDownloadConsent();

    if (_consentGiven) {
      setState(() {
        _isDownloading = true;
      });
    }
  }

  Future<void> _showConsentDialog() async {
    await widget.pdfScreenViewModel.setPdfDownloadConsent();
    bool result = await widget.pdfScreenViewModel.getPdfDownloadConsent();

    if (result) {
      setState(() {
        _consentGiven = true;
        _isDownloading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            color: whiteColor,
            tooltip: 'Compartilhar PDF',
            onPressed: () {
              widget.pdfScreenViewModel.shareArchive(widget.filePath);
            },
          ),
        ],
        title: Text(
          widget.filePath,
          style: TextStyle(fontSize: 14),
        ),
        backgroundColor: tertiaryColor,
      ),
      body: _isDownloading
          ? PdfViewLoader(
              pdfFuture: widget.pdfScreenViewModel
                  .downloadArchive(widget.downloadPdfPath, widget.filePath),
            )
          : ConsentRequestScreen(
              onButtonPressed: _showConsentDialog,
            ),
    );
  }
}
