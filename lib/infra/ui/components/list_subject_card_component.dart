import 'package:flutter/material.dart';
import 'package:game_code/infra/ui/components/subject_card_component.dart';
import '../../../domain/models/subject_model.dart';

class ListSubjectCardComponent extends StatelessWidget {
  const ListSubjectCardComponent({super.key, required this.listSubjects});
  final List<SubjectModel> listSubjects;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid.count(
          crossAxisCount: 2,
          children: listSubjects.map((subject) => SubjectCardComponent(subjectModel: subject)).toList(),
        ),
      ],
    );
  }
}
