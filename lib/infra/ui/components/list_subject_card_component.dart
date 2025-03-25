import 'package:flutter/material.dart';
import '../../../domain/models/subject_model.dart';
import '../../viewmodels/pdf_screen_view_model.dart';
import '../screens/subject_details_screen.dart';
import 'subject_card_component.dart';

class ListSubjectCardComponent extends StatelessWidget {
  const ListSubjectCardComponent({
    super.key,
    required this.listSubjects,
    required this.pdfScreenViewModel,
  });

  final List<SubjectModel> listSubjects;
  final PdfScreenViewModel pdfScreenViewModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final subject = listSubjects[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubjectDetailsScreen(
                        pdfScreenViewModel: pdfScreenViewModel,
                        subjectModel: subject,
                        listTestModel: subject.tests,
                      ),
                    ),
                  );
                },
                child: SubjectCardComponent(subjectModel: subject),
              );
            },
            childCount: listSubjects.length,
          ),
        ),
      ],
    );
  }
}
