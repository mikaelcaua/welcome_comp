import 'package:flutter/material.dart';
import 'package:game_code/domain/models/subject_model.dart';
import 'package:game_code/infra/ui/components/list_subject_card_component.dart';
import 'package:game_code/infra/ui/components/search_section_component.dart';
import 'package:game_code/infra/ui/theme/fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchSectionComponent(),
            Text('Explore as disciplinas', style: h2Text),
            Flexible(
              child: ListSubjectCardComponent(listSubjects: [
                SubjectModel(title: 'Algoritmo', description: 'asdasd'),
                SubjectModel(title: 'Algoritmo', description: 'asdasd'),
                SubjectModel(title: 'Algoritmo', description: 'asdasd')
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
