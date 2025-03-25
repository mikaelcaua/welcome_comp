import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';
import '../../viewmodels/home_view_model.dart';
import '../../viewmodels/pdf_screen_view_model.dart';
import '../components/list_subject_card_component.dart';
import '../components/search_section_component.dart';
import '../theme/fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.pdfScreenViewModel});
  final PdfScreenViewModel pdfScreenViewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).getAllSubjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, child) {
          return Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchSectionComponent(onChanged: (value) {
                homeViewModel.searchSubjects(value);
              }),
              Text('Explore as disciplinas', style: h3Text.copyWith(color: whiteColor)),
              Expanded(
                child: homeViewModel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListSubjectCardComponent(
                        listSubjects: homeViewModel.subjects,
                        pdfScreenViewModel: widget.pdfScreenViewModel,
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}