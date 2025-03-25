import 'package:flutter_test/flutter_test.dart';
import 'package:welcome_comp/domain/models/subject_model.dart';
import 'package:welcome_comp/infra/repositories_imp/github_subject_repository.dart';

void main(){
  test('should return a dynamic list subjects', ()async{
    var response = await GithubSubjectRepository().getSubjectsWithTestsAndExemplars();
    print(response);
    expect(response, isA<List<SubjectModel>>());
   
  });
  
}