import 'package:flutter/material.dart';

import '../../../domain/models/subject_model.dart';
import '../../viewmodels/home_view_model.dart';
import '../../viewmodels/pdf_screen_view_model.dart';
import '../components/list_subject_card_component.dart';
import '../components/search_section_component.dart';
import '../theme/fonts.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.homeViewModel, required this.pdfScreenViewModel});
  final HomeViewModel homeViewModel;
  final PdfScreenViewModel pdfScreenViewModel;

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
                    return ListSubjectCardComponent(listSubjects: listSubjects, pdfScreenViewModel: pdfScreenViewModel,);
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
