import 'package:flutter/material.dart';
import '../../../domain/models/subject_model.dart';
import '../../../domain/models/test_model.dart';
import '../../viewmodels/pdf_screen_view_model.dart';
import '../components/list_test_component.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class SubjectDetailsScreen extends StatelessWidget {
  const SubjectDetailsScreen({
    super.key,
    required this.subjectModel,
    required this.pdfScreenViewModel, required this.listTestModel,
  });
  final SubjectModel subjectModel;
  final PdfScreenViewModel pdfScreenViewModel;
  final List<TestModel> listTestModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjectModel.name,
                    style: h1Text.copyWith(color: whiteColor),
                  ),
                  Text(
                    subjectModel.description,
                    style: h2Text.copyWith(color: whiteColor),
                  ),
                ],
              ),
            ),
          ),
          ListTestComponent(
              tests: subjectModel.tests,
              subjectModel: subjectModel,
              pdfScreenViewModel: pdfScreenViewModel)
        ],
      ),
    );
  }
}
