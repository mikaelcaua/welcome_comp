import 'package:flutter/material.dart';
import '../../viewmodels/pdf_screen_view_model.dart';
import '../components/consent_dialog.dart';
import '../components/pdf_view_loader.dart';
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
    final bool? consent = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return ConsentDialog(
          onConfirm: () => Navigator.pop(context, true),
          onCancel: () => Navigator.pop(context, false),
        );
      },
    );

    if (consent == true) {
      await widget.pdfScreenViewModel.setPdfDownloadConsent(true);
      bool result = await widget.pdfScreenViewModel.getPdfDownloadConsent();
      if (result) {
        setState(() {
          _consentGiven = true;
          _isDownloading = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visualizando PDF')),
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
