import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';
import 'package:welcome_comp/infra/viewmodels/pdf_screen_view_model.dart';
import '../../../domain/models/exemplar_model.dart';
import '../screens/pdf_viewer_screen.dart';

class ClickableExemplarComponent extends StatelessWidget {
  const ClickableExemplarComponent(
      {super.key,
      required this.exemplarModel,
      required this.pdfScreenViewModel});
  final ExemplarModel exemplarModel;
  final PdfScreenViewModel pdfScreenViewModel;

  Future<void> _openPdf(BuildContext context, String url) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerScreen(
          filePath:
              '${exemplarModel.subjectName}_${exemplarModel.testName}_${exemplarModel.name}',
          downloadPdfPath: url,
          pdfScreenViewModel: pdfScreenViewModel,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openPdf(context, exemplarModel.downloadUrl),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            exemplarModel.name,
            style: TextStyle(fontSize: 18, color: whiteColor),
          ),
          Icon(Icons.download,color: whiteColor,)
        ],
      ),
    );
  }
}
