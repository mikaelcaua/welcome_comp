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
          backgroundColor: greyColor,
          elevation: 0),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subjectModel.description,
                          style: h3Text.copyWith(
                            color: whiteColor,
                          ),
                        ),
                      ],
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
