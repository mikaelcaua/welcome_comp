import 'package:flutter/material.dart';
import '../../usecases/get_all_subjects_usecase.dart';
import '../../domain/models/subject_model.dart';
import '../../usecases/load_all_subjects_offline_usecase.dart';
import '../../usecases/save_all_subjects_offline_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  final GetAllSubjectsUsecase getAllSubjectsUsecase;
  final SaveAllSubjectsOfflineUsecase saveAllSubjectsOfflineUsecase;
  final LoadAllSubjectsOfflineUsecase loadAllSubjectsOfflineUsecase;

  HomeViewModel({
    required this.loadAllSubjectsOfflineUsecase,
    required this.saveAllSubjectsOfflineUsecase,
    required this.getAllSubjectsUsecase,
  });

  List<SubjectModel> allSubjects = [];
  List<SubjectModel> subjects = [];
  bool isLoading = false;

  Future<void> getAllSubjects() async {
    isLoading = true;
    notifyListeners();
    try {
      final fetchedSubjects = await getAllSubjectsUsecase.execute();
      allSubjects = fetchedSubjects;
      subjects = List.from(allSubjects); 
      await saveAllSubjectsOfflineUsecase.execute(fetchedSubjects);
    } catch (e) {
      final fetchedSubjects = await loadAllSubjectsOfflineUsecase.execute();
      allSubjects = fetchedSubjects;
      subjects = List.from(allSubjects);
    }
    isLoading = false;
    notifyListeners();
  }

  void searchSubjects(String search) {
    if (search.isEmpty) {
      subjects = List.from(allSubjects);
    } else {
      subjects = allSubjects
          .where((element) =>
              element.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}