import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/status_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/status/domain/repo/status_repo.dart';

class CreateStatusUsecase
    extends UseCase<Future<Either<Failure, Unit>>, CreateStatusParam> {
  final StatusRepo statusRepo;

  CreateStatusUsecase(this.statusRepo);

  @override
  Future<Either<Failure, Unit>> call(CreateStatusParam param) {
    return statusRepo.createStatus(param);
  }
}
