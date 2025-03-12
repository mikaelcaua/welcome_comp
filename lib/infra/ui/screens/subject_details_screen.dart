import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/components/list_test_component.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';
import '../../../domain/models/subject_model.dart';
import '../../viewmodels/pdf_screen_view_model.dart';
import '../../viewmodels/subject_view_model.dart';
import '../components/list_exemplar_component.dart';
import '../theme/fonts.dart';

class SubjectDetailsScreen extends StatelessWidget {
  const SubjectDetailsScreen({
    super.key,
    required this.subjectModel,
    required this.subjectViewModel,
    required this.pdfScreenViewModel,
  });
  final SubjectModel subjectModel;
  final SubjectViewModel subjectViewModel;
  final PdfScreenViewModel pdfScreenViewModel;

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
                    subjectModel.title,
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
          ListTestComponent(tests: subjectModel.tests, subjectModel: subjectModel, listExemplarModel: subjectViewModel.getAllInformationsTest, pdfScreenViewModel: pdfScreenViewModel)
        ],
      ),
    );
  }
}
