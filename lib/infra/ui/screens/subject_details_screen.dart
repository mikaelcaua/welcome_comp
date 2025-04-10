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
    required this.pdfScreenViewModel,
    required this.listTestModel,
  });
  final SubjectModel subjectModel;
  final PdfScreenViewModel pdfScreenViewModel;
  final List<TestModel> listTestModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            subjectModel.name,
            style: h2Text.copyWith(color: whiteColor),
          ),
          backgroundColor: primaryColor,
          elevation: 0),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'As provas que você já abriu ficam salvas e podem ser acessadas mesmo sem internet :)',
                      style: h4Text.copyWith(
                        color: whiteColor,
                      ),
                    ),
                  ),
                  if ((subjectModel.description).isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        subjectModel.description,
                        style: h4Text.copyWith(
                          color: whiteColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          ListTestComponent(
            tests: subjectModel.tests,
            subjectModel: subjectModel,
            pdfScreenViewModel: pdfScreenViewModel,
          ),
        ],
      ),
    );
  }
}
