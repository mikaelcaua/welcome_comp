import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/theme/fonts.dart';
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
      required this.pdfScreenViewModel});
  final List<TestModel> tests;
  final SubjectModel subjectModel;
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
              backgroundColor: greyColor,
              title: Text(
                test.name,
                style: h3Text.copyWith(color: whiteColor),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _isExpanded[index] = expanded;
                });
              },
              initiallyExpanded: _isExpanded[index],
              children: [
                ListExemplarComponent(
                  
                  testName: test.name,
                  subjectName: widget.subjectModel.name,
                  pdfScreenViewModel: widget.pdfScreenViewModel,
                  listExemplarModel: test.listExemplarModel,
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
