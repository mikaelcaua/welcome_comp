
import '../models/exemplar_model.dart';

abstract class TestExemplarRepository {
  Future<List<ExemplarModel>> getTestExemplars(String url);
}