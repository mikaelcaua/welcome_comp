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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20,0,20),
      child: Column(
        spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listExemplarModel.map((exemplar) {
            return ClickableExemplarComponent(
              exemplarModel: exemplar,
              pdfScreenViewModel: pdfScreenViewModel,
            );
          }).toList()),
    );
  }
}
