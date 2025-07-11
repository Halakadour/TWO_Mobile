import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/status/data/models/status_model.dart';
import 'package:two_mobile/features/status/domain/repo/status_repo.dart';

class ShowStatusUsecase extends UseCase<
    Future<Either<Failure, List<StatusModel>>>, TokenWithIdParam> {
  final StatusRepo statusRepo;

  ShowStatusUsecase(this.statusRepo);

  @override
  Future<Either<Failure, List<StatusModel>>> call(TokenWithIdParam param) {
    return statusRepo.showStatus(param);
  }
}
