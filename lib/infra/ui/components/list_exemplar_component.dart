import 'package:flutter/material.dart';
import '../../../domain/models/exemplar_model.dart';
import '../../viewmodels/pdf_screen_view_model.dart';
import 'clickable_exemplar_component.dart';

class ListExemplarComponent extends StatelessWidget {
  const ListExemplarComponent(
      {super.key,
      required this.listExemplarModel,
      required this.pdfScreenViewModel,
      required this.testName,
      required this.subjectName});
  final List<ExemplarModel> listExemplarModel;
  final PdfScreenViewModel pdfScreenViewModel;
  final String testName;
  final String subjectName;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listExemplarModel.map((exemplar) {
          exemplar.subjectName = subjectName;
          exemplar.testName = testName;
          return ClickableExemplarComponent(
            exemplarModel: exemplar,
            pdfScreenViewModel: pdfScreenViewModel,
          );
        }).toList());
  }
}
