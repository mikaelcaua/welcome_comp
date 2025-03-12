import 'package:flutter/material.dart';
import '../../../domain/models/exemplar_model.dart';
import '../../../domain/models/subject_model.dart';
import '../../../domain/models/test_model.dart';
import '../../viewmodels/pdf_screen_view_model.dart';
import '../theme/colors.dart';
import 'list_exemplar_component.dart';

class ListTestComponent extends StatefulWidget {
  const ListTestComponent(
      {super.key,
      required this.tests,
      required this.subjectModel,
      required this.listExemplarModel,
      required this.pdfScreenViewModel});
  final List<TestModel> tests;
  final SubjectModel subjectModel;
  final Future<List<ExemplarModel>> Function(String) listExemplarModel;
  final PdfScreenViewModel pdfScreenViewModel;

  @override
  State<ListTestComponent> createState() => _ListTestComponentState();
}

class _ListTestComponentState extends State<ListTestComponent> {
  final List<bool> _isExpanded = [];

  @override
  void initState() {
    super.initState();
    _isExpanded
        .addAll(List.generate(widget.subjectModel.tests.length, (_) => false));
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final test = widget.tests[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ExpansionTile(
              backgroundColor: whiteColor,
              title: Text(
                'Prova ${index + 1}',
                style: const TextStyle(color: whiteColor),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _isExpanded[index] = expanded;
                });
              },
              initiallyExpanded: _isExpanded[index],
              children: [
                FutureBuilder(
                  future: widget.listExemplarModel(test.gitUrl),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Erro: ${snapshot.error}',
                          style: const TextStyle(color: whiteColor));
                    }
                    if (snapshot.hasData) {
                      return ListExemplarComponent(
                        testName: 'prova ${index + 1}',
                        subjectName: widget.subjectModel.title,
                        pdfScreenViewModel: widget.pdfScreenViewModel,
                        listExemplarModel: snapshot.data!,
                      );
                    } else {
                      return const Center(
                        child: Text('Sem dados disponíveis',
                            style: TextStyle(color: whiteColor)),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
        childCount: widget.subjectModel.tests.length,
      ),
    );
  }
}
