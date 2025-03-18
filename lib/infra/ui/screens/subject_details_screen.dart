import 'package:flutter/material.dart';
import 'package:welcome_comp/domain/models/test_model.dart';
import '../../../domain/models/subject_model.dart';
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        'https://images.pexels.com/photos/11035468/pexels-photo-11035468.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
