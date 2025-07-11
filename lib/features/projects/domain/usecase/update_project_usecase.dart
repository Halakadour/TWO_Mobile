import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/projects/domain/repo/project_repo.dart';

class UpdateProjectUsecase
    extends UseCase<Future<Either<Failure, Unit>>, UpdateParameters> {
  final ProjectRepo projectRepo;

  UpdateProjectUsecase({required this.projectRepo});
  @override
  Future<Either<Failure, Unit>> call(UpdateParameters param) {
    return projectRepo.updateProject(
        param.fullName,
        param.companyName,
        param.email,
        param.phone,
        param.projectType,
        param.projectDescraption,
        param.cost,
        param.duration,
        param.requirements,
        param.document,
        param.cooperationType,
        param.contactTime,
        param.private,
        param.projectId,
        param.token);
  }
}

class UpdateParameters {
  String fullName;
  String companyName;
  String email;
  String phone;
  String projectType;
  String projectDescraption;
  String cost;
  String duration;
  String requirements;
  String document;
  String cooperationType;
  String contactTime;
  String private;
  String projectId;
  String token;
  UpdateParameters({
    required this.fullName,
    required this.companyName,
    required this.email,
    required this.phone,
    required this.projectType,
    required this.projectDescraption,
    required this.cost,
    required this.duration,
    required this.document,
    required this.requirements,
    required this.cooperationType,
    required this.contactTime,
    required this.private,
    required this.projectId,
    required this.token,
  });
}
