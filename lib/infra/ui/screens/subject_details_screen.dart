import 'package:flutter/material.dart';

import '../../../domain/models/subject_model.dart';
import '../../viewmodels/subject_view_model.dart';
import '../components/list_exemplar_component.dart';
import '../theme/fonts.dart';


class SubjectDetailsScreen extends StatelessWidget {
  const SubjectDetailsScreen(
      {super.key, required this.subjectModel, required this.subjectViewModel});
  final SubjectModel subjectModel;
  final SubjectViewModel subjectViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: h1Text,
                  ),
                  Text(
                    subjectModel.description,
                    style: h2Text,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final test = subjectModel.tests[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Prova ${index + 1}'),
                      FutureBuilder(
                        future: subjectViewModel
                            .getAllInformationsTest(test.gitUrl),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            return ListExemplarComponent(
                                listExemplarModel: snapshot.data!);
                          } else {
                            return const Center(
                              child: Text('Sem dados disponíveis'),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
              childCount: subjectModel.tests.length,
            ),
          ),
        ],
      ),
    );
  }
}
