import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecase/usecase.dart';
import 'package:two_mobile/features/projects/data/model/show_my_project_response_model.dart';
import 'package:two_mobile/features/projects/domain/repo/project_repo.dart';

class ShowMyProjectUsecase
    extends Usecase<Future<Either<Failure, List<MyProjectModel>>>, String> {
  final ProjectRepo projectRepo;

  ShowMyProjectUsecase({required this.projectRepo});
  @override
  Future<Either<Failure, List<MyProjectModel>>> call(String param) async {
    return projectRepo.showMyPorject(param);
  }
}
