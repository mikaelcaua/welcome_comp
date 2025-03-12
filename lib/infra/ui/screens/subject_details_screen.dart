import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';
import '../../../domain/models/subject_model.dart';
import '../../viewmodels/pdf_screen_view_model.dart';
import '../../viewmodels/subject_view_model.dart';
import '../components/list_exemplar_component.dart';
import '../theme/fonts.dart';

class SubjectDetailsScreen extends StatefulWidget {
  const SubjectDetailsScreen({
    super.key,
    required this.subjectModel,
    required this.subjectViewModel,
    required this.pdfScreenViewModel,
  });
  final SubjectModel subjectModel;
  final SubjectViewModel subjectViewModel;
  final PdfScreenViewModel pdfScreenViewModel;

  @override
  _SubjectDetailsScreenState createState() => _SubjectDetailsScreenState();
}

class _SubjectDetailsScreenState extends State<SubjectDetailsScreen> {
  final Color searchSectionComponent = const Color.fromRGBO(77, 117, 249, 1);
  final List<bool> _isExpanded = [];

  @override
  void initState() {
    super.initState();
    _isExpanded
        .addAll(List.generate(widget.subjectModel.tests.length, (_) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: searchSectionComponent,
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
                    widget.subjectModel.title,
                    style: h1Text.copyWith(color: whiteColor),
                  ),
                  Text(
                    widget.subjectModel.description,
                    style: h2Text.copyWith(color: whiteColor),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final test = widget.subjectModel.tests[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
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
                        future: widget.subjectViewModel
                            .getAllInformationsTest(test.gitUrl),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
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
          ),
        ],
      ),
    );
  }
}
