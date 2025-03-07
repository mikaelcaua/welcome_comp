import 'package:flutter/material.dart';
import 'package:game_code/domain/models/subject_model.dart';
import 'package:game_code/infra/ui/components/subject_card_component.dart';

class ListSubjectCardComponent extends StatelessWidget {
  const ListSubjectCardComponent({super.key, required this.listSubjects});
  final List<SubjectModel> listSubjects;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, 
      mainAxisSpacing: 8.0, 
      crossAxisSpacing: 8.0,
      children: listSubjects.map((subject) => SubjectCardComponent(subjectModel: subject)).toList(),
    );
  }
}