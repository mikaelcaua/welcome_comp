import 'package:flutter/material.dart';
import 'package:game_code/domain/models/subject_model.dart';
import 'package:game_code/infra/ui/components/list_subject_card_component.dart';
import 'package:game_code/infra/ui/components/search_section_component.dart';
import 'package:game_code/infra/ui/theme/fonts.dart';
import 'package:game_code/infra/viewmodels/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.homeViewModel});
  final HomeViewModel homeViewModel;
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
            Expanded(
              child: FutureBuilder<List<SubjectModel>>(
                future: homeViewModel.getAllSubjects(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final listSubjects = snapshot.data!;
                    return ListSubjectCardComponent(listSubjects: listSubjects);
                  } else {
                    return Center(child: Text('Nenhuma disciplina encontrada'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
