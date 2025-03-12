import 'package:flutter/material.dart';

import '../../../domain/models/subject_model.dart';
import '../../viewmodels/subject_view_model.dart';
import '../screens/subject_details_screen.dart';
import 'subject_card_component.dart';

class ListSubjectCardComponent extends StatelessWidget {
  const ListSubjectCardComponent(
      {super.key, required this.listSubjects, required this.subjectViewModel});
  final List<SubjectModel> listSubjects;
  final SubjectViewModel subjectViewModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid.count(
          crossAxisCount: 2,
          children: listSubjects
              .map((subject) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubjectDetailsScreen(
                          subjectModel: subject,
                          subjectViewModel: subjectViewModel,
                        ),
                      ),
                    );
                  },
                  child: SubjectCardComponent(subjectModel: subject)))
              .toList(),
        ),
      ],
    );
  }
}
