
import '../../application/usecases/get_all_informations_test_usecase.dart';
import '../../domain/models/exemplar_model.dart';

class SubjectViewModel {
  final GetAllInformationsTestUsecase getAllInformationsTestUsecase;

  SubjectViewModel({required this.getAllInformationsTestUsecase});

  Future<List<ExemplarModel>> getAllInformationsTest(String url) {
    return getAllInformationsTestUsecase.execute(url);
  }
}
