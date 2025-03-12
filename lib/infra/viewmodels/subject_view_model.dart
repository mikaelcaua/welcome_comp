import '../../usecases/get_all_informations_test_usecase.dart';
import '../../domain/models/exemplar_model.dart';

class SubjectViewModel {
  final GetAllInformationsTestUsecase getAllInformationsTestUsecase;

  SubjectViewModel({required this.getAllInformationsTestUsecase});

  Future<List<ExemplarModel>> getAllInformationsTest(String url) async {
    try {
      return await getAllInformationsTestUsecase.execute(url);
    } catch (e) {
      return [];
    }
  }
}
